# frozen_string_literal: true

module Creatio
  class ContactResource < ItemResource
    RESOURCE_NAME = 'Contact'

    def retrieve(field, value)
      query = "?$filter=#{field} eq '#{value}'"
      results = get_request("#{RESOURCE_NAME}#{query}").body.dig('value')
      return unless results

      results.any? ? Contact.new(results[0]) : nil
    end

    def create(**attributes)
      Contact.new(post_request(RESOURCE_NAME, body: attributes).body)
    end

    def update(contact_id:, **attributes)
      patch_request("#{RESOURCE_NAME}(#{contact_id})", body: attributes)
    end
  end
end
