# frozen_string_literal: true

module Creatio
  class ActivityCategoryResource < Resource
    RESOURCE_NAME = 'ActivityCategory'

    def all
      get_request(RESOURCE_NAME).body['value'].map { |activity_status| ActivityCategory.new(activity_status) }
    end
  end
end
