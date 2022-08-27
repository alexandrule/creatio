# frozen_string_literal: true

module Creatio
  class LeadResource < Resource
    RESOURCE_NAME = "Lead"

    def retrieve(field, value)
      query = "?$filter=#{field} eq '#{value}'"
      Lead.new(get_request(RESOURCE_NAME + query).body.dig("value")[0])
    end

    def create(**attributes)
      Lead.new(post_request(RESOURCE_NAME, body: attributes).body)
    end
  end
end
