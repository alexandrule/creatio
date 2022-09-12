# frozen_string_literal: true

require "test_helper"

class DealsResourceTest < Minitest::Test
  def test_retrieve
    stub = stub_request(
      "https://example.com/0/odata/Opportunity?%24filter=Contact%2FId+eq+%271a7ece2d-628d-4677-a717-56c2cecda346%27",
      response: stub_response(fixture: "deals/retrieve")
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    deal = client.deals.retrieve("Contact/Id", "1a7ece2d-628d-4677-a717-56c2cecda346")

    assert_equal "1a7ece2d-628d-4677-a717-56c2cecda346", deal.contact_id
  end
end
