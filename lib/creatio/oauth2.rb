# frozen_string_literal: true

module Creatio
  class OAuth2
    OAUTH_ENDPOINT = '/connect/token'

    attr_reader :client_id, :client_secret, :api_endpoint, :adapter

    def initialize(client_id, client_secret, api_endpoint:, adapter: Faraday.default_adapter, stubs: nil)
      @client_id = client_id
      @client_secret = client_secret
      @api_endpoint = api_endpoint
      @adapter = adapter
      @stubs = stubs
    end

    def connection
      @connection ||= Faraday.new(api_endpoint) do |conn|
        conn.basic_auth(client_id, client_secret)
        conn.adapter adapter, @stubs
      end
    end

    def get_access_token
      begin
        response =
          connection.post(OAUTH_ENDPOINT) do |req|
            [
              req.headers['Content-Type'] = 'application/x-www-form-urlencoded',
              req.body = URI.encode_www_form({ grant_type: 'client_credentials' })
            ]
          end

        response = JSON.parse(response.body)

        {
          access_token: response['access_token'],
          expires_in: response['expires_in'].to_i,
          token_type: response['token_type']
        }

      rescue Faraday::ConnectionFailed => e
        raise Creatio::Error::ConnectionFailed, e.message
      end
    end
  end
end
