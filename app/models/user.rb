class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :validate_campaigns_list

  # Callbacks
  after_commit on: [:create, :update] do
    __elasticsearch__.index_document
  end

  after_commit on: [:destroy] do
    __elasticsearch__.delete_document
  end

  # Elasticsearch index name
  index_name "users"

  # Document mapping
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, type: :text
      indexes :email, type: :keyword

      indexes :campaigns_list, type: :nested do
        indexes :campaign_name, type: :text
        indexes :campaign_id, type: :keyword
      end
    end
  end

  # Search users by campaign names
  def self.search_by_campaign_names(campaign_names)
    query = {
      query: {
        bool: {
          filter: {
            bool: {
              should: campaign_names.map do |name|
                {
                  nested: {
                    path: 'campaigns_list',
                    query: {
                      match: { 'campaigns_list.campaign_name': name }
                    }
                  }
                }
              end
            }
          }
        }
      }
    }

    __elasticsearch__.search(query).records
  end

  private

  def validate_campaigns_list
    if campaigns_list.is_a?(Array)
      campaigns_list.each_with_index do |campaign, index|
        if campaign['campaign_name'].blank?
          errors.add(:campaigns_list, "Campaign name can't be blank at index #{index}")
        end

        if campaign['campaign_id'].blank?
          errors.add(:campaigns_list, "Campaign ID can't be blank at index #{index}")
        end
      end
    else
      errors.add(:campaigns_list, 'must be an array')
    end
  end
end
