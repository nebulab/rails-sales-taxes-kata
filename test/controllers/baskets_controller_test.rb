require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get baskets_show_url
    assert_response :success
  end

  test 'should get new' do
    get baskets_new_url
    assert_response :success
  end

  test 'should get create' do
    get baskets_create_url
    assert_response :success
  end
end
