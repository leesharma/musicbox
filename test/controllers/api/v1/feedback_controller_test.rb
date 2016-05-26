require 'test_helper'

class API::V1::FeedbackControllerTest < ActionController::TestCase
  # Performs a test POST request to :create, sets @response
  # @param [Boolean] message  should the message be sent in the request,
  #                           defaults to true
  def post_feedback(message: true)
    user        = create(:user, email: 'foo@example.com')
    hello_world = message ? 'hello world' : nil
    post :create,
         feedback: { message: hello_world, user_id: user.id },
         format: :json
  end

  test 'should POST create' do
    post_feedback
    assert_response :created
  end

  test 'create should respond with new feedback' do
    post_feedback
    expected = { 'message' => 'hello world', 'user' => 'foo@example.com' }
    subject  = JSON.parse @response.body

    assert_equal subject, expected
  end

  test 'create with invalid data should respond with unprocessable entity' do
    post_feedback(message: false)
    assert_response :unprocessable_entity
  end
end
