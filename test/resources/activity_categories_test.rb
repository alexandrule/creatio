# frozen_string_literal: true

require "test_helper"

class ActivityStatusesResourceTest < Minitest::Test
  def test_all
    stub = stub_request(
      "https://example.com/0/odata/ActivityCategory",
      response: stub_response(fixture: "activity_categories/all"),
      method: :get
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    activity_categories = client.activity_categories.all
  end
end
