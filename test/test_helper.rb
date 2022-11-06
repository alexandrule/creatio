# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "creatio"
require "minitest/autorun"
require "faraday"
require "json"
# require "pry"

class Minitest::Test
  def stub_response(fixture: nil, status: 201, headers: { "Content-Type" => "application/json" })
    return unless fixture

    [status, headers, File.read("test/fixtures/#{fixture}.json")]
  end

  def stub_request(path, response:, method: :get, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      # binding.pry if method == :patch
      arguments = [method, path]
      arguments << body.to_json if [:post, :patch].include?(method)
      stub.send(*arguments) { |_env| response }
    end
  end
end
