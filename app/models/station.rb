# frozen_string_literal: true

class Station
  ELASTICSEARCH_INDEX = 'stations-alias'

  def self.elasticsearch_client
    @@elasticsearch_client ||= Elasticsearch::Client.new
  end

  def self.find(id)
    self.elasticsearch_client.get(index: ELASTICSEARCH_INDEX, id:)['_source']
  end

  def self.search(name)
    return [] if name.blank?

    query = {
      query: {
        multi_match: {
          query: name,
          type: "bool_prefix",
          fields: [
            "name",
            "name._2gram",
            "name._3gram"
          ]
        }
      }
    }

    result = self.elasticsearch_client.search(index: ELASTICSEARCH_INDEX, body: query)

    result.dig('hits', 'hits').map { |hit| hit['_source'] }
  end
end
