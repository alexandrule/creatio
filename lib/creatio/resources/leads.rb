# frozen_string_literal: true

module Creatio
  class LeadResource < Resource
    RESOURCE_NAME = 'Lead'

    def retrieve(field, value)
      query = field == 'Id' ? "?$filter=#{field} eq #{value}" : "?$filter=#{field} eq '#{value}'"
      results = get_request("#{RESOURCE_NAME}#{query}").body.dig('value')
      return unless results

      results.any? ? Lead.new(results[0]) : nil
    end

    def create(**attributes)
      Lead.new(post_request(RESOURCE_NAME, body: attributes).body)
    end

    def update(lead_id:, **attributes)
      patch_request("#{RESOURCE_NAME}(#{lead_id})", body: attributes)
    end
  end
end
