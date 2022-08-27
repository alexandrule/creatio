# frozen_string_literal: true

module Creatio
  class DealResource < Resource
    RESOURCE_NAME = "Opportunity"

    def retrieve(field, value)
      query = "?$filter=#{field} eq '#{value}'"
      Deal.new(get_request(RESOURCE_NAME + query).body.dig("value")[0])
    end
  end
end
