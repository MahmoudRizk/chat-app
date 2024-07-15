require "test_helper"

class ChatTest < ActionDispatch::IntegrationTest
  test "Get list of application's chat" do
    application_id = "5839e194-5272-42dd-9fb6-157eb7be5e70"
    get "/applications/#{application_id}/chats"
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


  test "create new application's chat" do
    application_id = "5839e194-5272-42dd-9fb6-157eb7be5e70"
    post "/applications/#{application_id}/chats", params: {chat_name: "Chat 1"}

    assert_equal 201, status

    json_response = JSON.parse(response.body)
    assert_includes(json_response, "message")
    assert_includes(json_response, "data")

    data = json_response['data']

    assert_includes(data, 'id')
    assert_includes(data, 'name')

  end
end
