# frozen_string_literal: true

class StationStatus
  def self.sql(station_id)
    """
      SELECT
        DATE_SUB(requested_at, INTERVAL 4 HOUR) AS requested_at_et,
        num_docks_available
      FROM
        `lucysight.station_statuses`
      WHERE
        station_id = '#{station_id}'
    """
  end

  def self.get_statuses_for_station(station_id)
    BigQuery::Client.instance.query(self.sql(station_id))
  end
end
