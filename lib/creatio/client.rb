# frozen_string_literal: true

require "faraday"

module Creatio
  class Client
    attr_reader :base_url, :api_key, :adapter

    def initialize(base_url:, api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @base_url = base_url
      @api_key  = api_key
      @adapter  = adapter
      # Test stubs for requests
      @stubs = stubs
    end

    def connection
      @connection ||= Faraday.new(base_url) do |conn|
        conn.request :authorization, :Bearer, api_key
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end

    def activities
      ActivityResource.new(self)
    end

    def contacts
      ContactResource.new(self)
    end

    def deals
      DealResource.new(self)
    end

    def leads
      LeadResource.new(self)
    end

    def activity_statuses
      ActivityStatusResource.new(self)
    end

    def activity_categories
      ActivityCategoryResource.new(self)
    end
  end
end
