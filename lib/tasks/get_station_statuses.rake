# frozen_string_literal: true

task get_station_statuses: [:environment] do
  response = Faraday.get('https://gbfs.citibikenyc.com/gbfs/en/station_status.json')
  json = JSON.parse(response.body)
  station_statuses = json.dig('data', 'stations')
  requested_at = Time.now
  keys = StationStatus.new.attributes.keys

  StationStatus.insert_all(
    station_statuses.map { |station_status| station_status.slice(*keys).merge(requested_at:) }
  )

  puts StationStatus.count
end
