require 'test_helper'

class APIRoutingTest < ActionDispatch::IntegrationTest
  test 'GET /api/v1 => static_pages#index' do
    assert_routing(
      { path: '/api/v1', method: :get },
      { controller: 'api/v1/static_pages', action: 'index' }
    )
  end

  test 'POST /api/v1/feedback => feedback#create' do
    assert_routing(
      { path: '/api/v1/feedback', method: :post },
      { controller: 'api/v1/feedback', action: 'create' }
    )
  end

  test '404 error' do
    get '/404'
    assert_response :not_found
  end

  test '422 error' do
    get '/422'
    assert_response :unprocessable_entity
  end

  test '500 error' do
    get '/500'
    assert_response :internal_server_error
  end
end
