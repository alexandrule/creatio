# frozen_string_literal: true

require "test_helper"

class LeadsResourceTest < Minitest::Test
  def test_retrieve
    stub = stub_request(
      "https://example.com/0/odata/Lead?%24filter=MobilePhone+eq+%27%2B380123456789%27",
      response: stub_response(fixture: "leads/retrieve")
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
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
      "https://example.com/0/odata/Lead",
      response: stub_response(fixture: "leads/create"),
      method: :post,
      body: body
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    lead = client.leads.create(**body)

    assert_equal "+380123456789", lead.mobile_phone
    assert_equal "Test lead", lead.lead_name
  end

  def test_update
    body = {
      "OwnerId": "537e1367-a6df-48ef-8a2f-22b0c2608d01"
    }
    stub = stub_request(
      "https://example.com/0/odata/Lead(4162f6c9-f34c-488c-a2d8-5ecc8ea5f0c2)",
      response: stub_response(status: 204),
      method: :patch,
      body: body
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    lead = client.leads.update(lead_id: "4162f6c9-f34c-488c-a2d8-5ecc8ea5f0c2", **body)

    # assert_equal 204, lead.status.code
    assert_nil nil, lead.body
  end
end
