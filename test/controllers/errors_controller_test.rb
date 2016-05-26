require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test 'should get not_found' do
    get :not_found
    assert_response :not_found

    expected = { 'error' => 'Page not found' }
    subject  = JSON.parse(@response.body)
    assert_equal expected, subject
  end

  test 'should get unprocessable_entity' do
    get :unprocessable_entity
    assert_response :unprocessable_entity

    expected = { 'error' => 'Unprocessable entity' }
    subject  = JSON.parse(@response.body)
    assert_equal expected, subject
  end

  test 'should get internal_server_error' do
    get :internal_server_error
    assert_response :internal_server_error

    expected = { 'error' => 'Internal server error' }
    subject  = JSON.parse(@response.body)
    assert_equal expected, subject
  end
end
