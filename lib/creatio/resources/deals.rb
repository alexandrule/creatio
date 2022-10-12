# frozen_string_literal: true

module Creatio
  class DealResource < Resource
    RESOURCE_NAME = "Opportunity"

    def retrieve(field, value)
      query = field == 'Contact/Id' ? "?$filter=#{field} eq #{value}" : "?$filter=#{field} eq '#{value}'"
      results = get_request("#{RESOURCE_NAME}#{query}").body.dig("value")
      results.any? ? Deal.new(results[0]) : []
    end
  end
end

