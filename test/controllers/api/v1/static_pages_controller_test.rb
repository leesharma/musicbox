require 'test_helper'

class API::V1::StaticPagesControllerTest < ActionController::TestCase
  test 'should GET index' do
    get :index, format: :json
    assert_response :success
  end

  test 'GET index should respond with API metadata' do
    get :index, format: :json
    expected = {
      'name'        => 'Musicbox',
      'description' => 'Helping people listen.',
      'version'     => 'v1',
    }
    subject = JSON.parse(@response.body)

    assert_equal subject, expected
  end
end
