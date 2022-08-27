# frozen_string_literal: true

require "test_helper"

class LeadsResourceTest < Minitest::Test
  def test_retrieve
    stub = stub_request(
      "https://example.com/Lead?%24filter=MobilePhone+eq+%27%2B380123456789%27",
      response: stub_response(fixture: "leads/retrieve")
    )
    client = Creatio::Client.new(base_url: "https://example.com/", api_key: "fake", adapter: :test, stubs: stub)
    lead = client.leads.retrieve("MobilePhone", '%2B380123456789')

    assert_equal "+380123456789", lead.mobile_phone
  end

  def test_create
    body = {
      "MobilePhone": "+380123456789",
      "LeadName": "Test lead",
      "LeadTypeId": "4eb933c2-d7bb-4711-8d57-3e59c2bcdc0f"
    }
    stub = stub_request(
      "https://example.com/Lead",
      response: stub_response(fixture: "leads/create"),
      method: :post,
      body: body
    )
    client = Creatio::Client.new(base_url: "https://example.com/", api_key: "fake", adapter: :test, stubs: stub)
    lead = client.leads.create(**body)

    assert_equal "+380123456789", lead.mobile_phone
    assert_equal "Test lead", lead.lead_name
  end
end
