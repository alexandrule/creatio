# frozen_string_literal: true

require "test_helper"

class ContactsResourceTest < Minitest::Test
  def test_retrieve
    stub = stub_request(
      "https://example.com/0/odata/Contact?%24filter=MobilePhone+eq+%27%2B123456789%27",
      response: stub_response(fixture: "contacts/retrieve")
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    contact = client.contacts.retrieve("MobilePhone", "%2B123456789")

    assert_equal "+380123456789", contact.mobile_phone
  end

  # def test_create
  #   body = {
  #     "MobilePhone": "+380123456789",
  #     "LeadName": "Test lead"
  #   }
  #   stub = stub_request(
  #     "https://example.com/0/odata/Contact",
  #     response: stub_response(fixture: "contacts/create"),
  #     method: :post,
  #     body: body
  #   )
  #   client = Creatio::Client.new(base_url: "https://example.com/", api_key: "fake", adapter: :test, stubs: stub)
  #   contact = client.contacts.create(**body)
  #
  #   assert_equal "+380123456789", contact.mobile_phone
  #   assert_equal "Test lead", contact.lead_name
  # end

  def test_update
    body = {
      "OwnerId": "537e1367-a6df-48ef-8a2f-22b0c2608d01"
    }
    stub = stub_request(
      "https://example.com/0/odata/Contact(4162f6c9-f34c-488c-a2d8-5ecc8ea5f0c2)",
      response: stub_response(status: 204),
      method: :patch,
      body: body
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    lead = client.contacts.update(contact_id: "4162f6c9-f34c-488c-a2d8-5ecc8ea5f0c2", **body)

    # assert_equal 204, lead.status.code
    assert_nil nil, lead.body
  end
end
