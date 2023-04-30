# frozen_string_literal: true

task :get_stations_bq do
  require "google/cloud/bigquery"

  KEYS = %w[station_id external_id lon name region_id short_name capacity legacy_id lat station_type]

  response = Faraday.get('https://gbfs.citibikenyc.com/gbfs/en/station_information.json')
  json = JSON.parse(response.body)
  stations = json.dig('data', 'stations')
  # requested_at = Time.now.utc.strftime('%Y-%m-%dT%H:%M:%S')

  # StationStatus.insert_all(
  #   station_statuses.map { |station_status| station_status.slice(*KEYS).merge(requested_at:) }
  # )

  bigquery = Google::Cloud::Bigquery.new project: "lucybikes"
  dataset  = bigquery.dataset 'lucysight'
  table    = dataset.table 'stations_v2'

  row_data = stations.map { |station_status| station_status.slice(*KEYS) }

  puts "Discovered #{row_data.count} rows"

  response = table.insert row_data

  puts response.insert_errors[0..10].map { |error| error.errors }

  if response.success?
    puts "Inserted rows successfully"
  else
    puts "Failed to insert #{response.error_rows.count} rows"
  end
end
