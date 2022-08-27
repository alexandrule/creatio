# frozen_string_literal: true

require "test_helper"

class ContactsResourceTest < Minitest::Test
  def test_retrieve
    stub = stub_request(
      "https://example.com/Contact?%24filter=MobilePhone+eq+%27%2B123456789%27",
      response: stub_response(fixture: "contacts/retrieve")
    )
    client = Creatio::Client.new(base_url: "https://example.com/", api_key: "fake", adapter: :test, stubs: stub)
    contact = client.contacts.retrieve("MobilePhone", "%2B123456789")

    assert_equal "+380123456789", contact.mobile_phone
  end

  # def test_create
  #   body = {
  #     "MobilePhone": "+380123456789",
  #     "LeadName": "Test lead"
  #   }
  #   stub = stub_request(
  #     "https://example.com/Contact",
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
end
