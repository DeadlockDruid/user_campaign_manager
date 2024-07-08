namespace :elasticsearch do
  desc "Recreate the Elasticsearch index for the User model and import all records"
  
  task recreate_user_index: :environment do
    User.__elasticsearch__.client.indices.delete index: User.index_name rescue nil
    User.__elasticsearch__.client.indices.create \
      index: User.index_name,
      body: { settings: User.settings.to_hash, mappings: User.mappings.to_hash }
    
    User.import(force: true)

    puts "Elasticsearch index for User model recreated and records imported."
  end
end
