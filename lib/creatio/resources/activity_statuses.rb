# frozen_string_literal: true

module Creatio
  class ActivityStatusResource < Resource
    RESOURCE_NAME = 'ActivityStatus'

    def all
      get_request(RESOURCE_NAME).body['value'].map { |activity_status| ActivityStatus.new(activity_status) }
    end
  end
end
