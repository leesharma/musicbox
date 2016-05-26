require 'test_helper'

class API::V1::FeedbackControllerTest < ActionController::TestCase
  setup do
    post :create, feedback: { message: 'hello world' }, format: :json
  end

  test 'should POST create' do
    assert_response :created
  end

  test 'create should respond with new feedback' do
    expected = { 'message' => 'hello world' }
    subject  = JSON.parse @response.body

    assert_equal subject, expected
  end
end
