require 'test_helper'

class HowTosControllerTest < ActionController::TestCase
  setup do
    @how_to = how_tos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:how_tos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create how_to" do
    assert_difference('HowTo.count') do
      post :create, how_to: { ht_img: @how_to.ht_img }
    end

    assert_redirected_to how_to_path(assigns(:how_to))
  end

  test "should show how_to" do
    get :show, id: @how_to
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @how_to
    assert_response :success
  end

  test "should update how_to" do
    patch :update, id: @how_to, how_to: { ht_img: @how_to.ht_img }
    assert_redirected_to how_to_path(assigns(:how_to))
  end

  test "should destroy how_to" do
    assert_difference('HowTo.count', -1) do
      delete :destroy, id: @how_to
    end

    assert_redirected_to how_tos_path
  end
end
