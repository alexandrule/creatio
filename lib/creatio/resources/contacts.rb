# frozen_string_literal: true

module Creatio
  class ContactResource < Resource
    RESOURCE_NAME = "Contact"

    def retrieve(field, value)
      query = "?$filter=#{field} eq '#{value}'"
      Contact.new(get_request(RESOURCE_NAME + query).body.dig("value")[0])
    end

    def update(contact_id:, **attributes)
      patch_request("#{RESOURCE_NAME}(#{contact_id})", body: attributes)
    end
  end
end
