# frozen_string_literal: true

require "test_helper"

class ActivitiesResourceTest < Minitest::Test
  def test_create
    body = {
      "Title": "New test activity",
      "ContactId": "d20a4f37-481d-454d-a501-e34793ea3b1b",
      "LeadId": "4162f6c9-f34c-488c-a2d8-5ecc8ea5f0c2",
      "OpportunityId": "0e0ae140-6c03-474c-873f-6f3444e80c5d"
    }
    stub = stub_request(
      "https://example.com/0/odata/Activity",
      response: stub_response(fixture: "activities/create"),
      method: :post,
      body: body
    )
    client = Creatio::Client.new(base_url: "https://example.com/0/odata/", api_key: "fake", adapter: :test, stubs: stub)
    activity = client.activities.create(**body)

    assert_equal "New test activity", activity.title
    assert_equal "24329a94-3409-47d7-a1aa-2c81035e1901", activity.lead_id
  end
end
