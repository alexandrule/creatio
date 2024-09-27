# frozen_string_literal: true

module Creatio
  class ItemResource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, headers: {})
      check_response(:get, url, client.connection.get(url, headers))
    end

    def post_request(url, body:, headers: {})
      check_response(:post, url, client.connection.post(url, body, headers))
    end

    def patch_request(url, body:, headers: {})
      check_response(:patch, url, client.connection.patch(url, body, headers))
    end

    def check_response(request_method, url, response)
      unless response&.status&.to_i&.between?(200, 299)
        raise "ERROR 444555543644. [#{ response&.status&.to_i } #{ request_method } #{ url }] response=[#{ response.inspect }]"
      end
      response
    end
  end
end
