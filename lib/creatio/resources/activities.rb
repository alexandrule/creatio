# frozen_string_literal: true

module Creatio
  class ActivityResource < Resource
    RESOURCE_NAME = "Activity"

    def create(**attributes)
      Activity.new(post_request(RESOURCE_NAME, body: attributes).body)
    end
  end
end
