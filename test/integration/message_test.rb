require "test_helper"

class MessageTest < ActionDispatch::IntegrationTest
  test "Get list of chat's messages" do
    application_id = "5839e194-5272-42dd-9fb6-157eb7be5e70"
    chat_id = "1"
    get "/applications/#{application_id}/chats/#{chat_id}/messages"
    assert_equal 200, status

    json_response = JSON.parse(response.body)
    assert_includes(json_response, "message")
    assert_includes(json_response, "data")

    data = json_response['data']

    data.each do |item|
      assert_includes(item, 'id')
      assert_includes(item, 'name')

    end

  end

  test "Create new message" do
    application_id = "5839e194-5272-42dd-9fb6-157eb7be5e70"
    chat_id = "1"

    post "/applications/#{application_id}/chats/#{chat_id}/messages", params: {message_name: "message 1"}
    assert_equal 201, status

    json_response = JSON.parse(response.body)
    assert_includes(json_response, "message")
    assert_includes(json_response, "data")

    data = json_response['data']

    assert_includes(data, 'id')
    assert_includes(data, 'name')

  end

end
