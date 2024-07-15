require "test_helper"

class ApplicationTest < ActionDispatch::IntegrationTest
  test "Call create application endpoint with valid request body." do
    post "/applications", params: {application_name: "Test applications"}
    assert_equal 201, status

    json_response = JSON.parse(response.body)
    assert_includes(json_response, "message")
    assert_includes(json_response, "data")

    data = json_response['data']

    assert_includes(data, 'id')
    assert_includes(data, 'application_name')

  end

  test "Call create application endpoint with missing request body." do
    post "/applications", params: {}
    assert_equal 400, status
  end
end
