class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  attribute :campaigns_list do
    object.campaigns_list.map do |campaign|
      {
        campaign_name: campaign['campaign_name'],
        campaign_id: campaign['campaign_id']
      }
    end
  end
end
