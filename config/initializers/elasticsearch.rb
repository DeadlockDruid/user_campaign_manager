Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: ENV['ELASTICSEARCH_HOST'] || 'localhost:9200',
  log: true,
  transport_options: {
    request: { timeout: 5 }
  }
)
