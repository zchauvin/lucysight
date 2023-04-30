# frozen_string_literal: true

require 'google/cloud/bigquery'

module BigQuery
  class Client
    def self.instance
      Thread.current[:'BigQuery::Client'] ||= Google::Cloud::Bigquery.new(project_id: 'lucybikes')
    end
  end
end
