# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create users with campaigns

unless User.any?
  User.create!([
    {
      name: 'Eleanor Rigby',
      email: 'eleanor.rigby@example.com',
      campaigns_list: [
        { campaign_name: 'Winter Sale', campaign_id: 'winter1' },
        { campaign_name: 'Spring Launch', campaign_id: 'spring1' }
      ]
    },
    {
      name: 'Charlie Brown',
      email: 'charlie.brown@example.com',
      campaigns_list: [
        { campaign_name: 'Back to School', campaign_id: 'school1' },
        { campaign_name: 'Holiday Specials', campaign_id: 'holiday1' }
      ]
    },
    {
      name: 'Alice Wonderland',
      email: 'alice.wonderland@example.com',
      campaigns_list: [
        { campaign_name: 'Summer Fest', campaign_id: 'summer1' },
        { campaign_name: 'Autumn Collection', campaign_id: 'autumn1' }
      ]
    },
    {
      name: 'Bruce Wayne',
      email: 'bruce.wayne@example.com',
      campaigns_list: [
        { campaign_name: 'Gotham Giveaway', campaign_id: 'gotham1' },
        { campaign_name: 'Heroic Sale', campaign_id: 'hero1' }
      ]
    },
    {
      name: 'Diana Prince',
      email: 'diana.prince@example.com',
      campaigns_list: [
        { campaign_name: 'Amazonian Offer', campaign_id: 'amazon1' },
        { campaign_name: 'Justice League', campaign_id: 'justice1' }
      ]
    }
  ])
end
