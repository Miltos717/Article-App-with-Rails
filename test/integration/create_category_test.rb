require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username:"Miltos",
                              email:"miltos@sample.com",
                              passord:"password",admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get "/categoryries/new"
    assert_response :success
    assert_difference 'Category.count',1  do
      post categories_path, params: {category: {name: "Sports"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submisison" do
    get "/categoryries/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "} }
    end
    assert_match "Sports", response.body
    assert_select 'div.alert'
  end
end
