# frozen_string_literal: true

module Creatio
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, headers: {})
      handle_response client.connection.get(url, headers)
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, headers)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.patch(url, body, headers)
    end

    # def default_headers
    #   { Authorization: "Bearer #{client.api_key}" }
    # end

    def handle_response(response)
      case response.status
      when 400, 401, 403, 404, 405, 406, 409, 500, 501, 502, 503, 504
        # raise Error, response.body.to_s
        response.body.to_s
      end

      response

      # case response.status
      #   when 400
      #   when 401
      #   when 403
      #   when 500
      #     raise Error
      # end
      #
      # response
    end
  end
end
