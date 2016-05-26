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
end
