# frozen_string_literal: true

# {:station_id=>"66dbe68e-0aca-11e7-82f6-3863bb44ef7c",
#   :external_id=>"66dbe68e-0aca-11e7-82f6-3863bb44ef7c",
#   :lat=>40.735238,
#   :lon=>-74.000271,
#   :name=>"Greenwich Ave & Charles St",
#   :region_id=>"71",
#   :short_name=>"5914.08",
#   :capacity=>57,
#   :legacy_id=>"383",
#   :station_type=>"classic"}

task :index_stations do
  require "google/cloud/bigquery"
  require 'elasticsearch'

  bigquery = Google::Cloud::Bigquery.new project: "lucybikes"
  # dataset  = bigquery.dataset 'lucysight'
  # table    = dataset.table 'stations'

  sql = "SELECT * FROM `lucysight.stations`"
  rows = bigquery.query sql

  puts "Discovered #{rows.count} rows"

  body = rows.map do |row|
    { index: { _index: 'stations', _id: row[:external_id], data: row } }
  end

  client = Elasticsearch::Client.new
  response = client.bulk(body: body)

  puts response
end
