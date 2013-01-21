require 'test_helper'

class LacsControllerTest < ActionController::TestCase
  setup do
    @lac = lacs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lacs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lac" do
    assert_difference('Lac.count') do
      post :create, lac: { longitude: @lac.longitude, name: @lac.name }
    end

    assert_redirected_to lac_path(assigns(:lac))
  end

  test "should show lac" do
    get :show, id: @lac
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lac
    assert_response :success
  end

  test "should update lac" do
    put :update, id: @lac, lac: { longitude: @lac.longitude, name: @lac.name }
    assert_redirected_to lac_path(assigns(:lac))
  end

  test "should destroy lac" do
    assert_difference('Lac.count', -1) do
      delete :destroy, id: @lac
    end

    assert_redirected_to lacs_path
  end
end
