# frozen_string_literal: true

module Creatio
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, headers: {})
      client.connection.get(url, default_headers.merge(headers))
    end

    def post_request(url, body:, headers: {})
      client.connection.post(url, body, default_headers.merge(headers))
    end

    def default_headers
      { Authorization: "Bearer #{client.api_key}" }
    end

    # def handle_response(response)
    #   case response.status
    #     when 400
    #     when 401
    #     when 403
    #     when 500
    #       raise Error
    #   end
    #
    #   response
    # end
  end
end
