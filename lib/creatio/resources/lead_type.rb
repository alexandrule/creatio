# frozen_string_literal: true

module Creatio
  class LeadTypeResource < Resource
    RESOURCE_NAME = "LeadType"

    def retrieve(field, value)
      LeadType.new(get_request(RESOURCE_NAME))
    end
  end
end
