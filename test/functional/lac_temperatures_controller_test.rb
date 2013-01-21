require 'test_helper'

class LacTemperaturesControllerTest < ActionController::TestCase
  setup do
    @lac_temperature = lac_temperatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lac_temperatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lac_temperature" do
    assert_difference('LacTemperature.count') do
      post :create, lac_temperature: { temperature: @lac_temperature.temperature, when: @lac_temperature.when }
    end

    assert_redirected_to lac_temperature_path(assigns(:lac_temperature))
  end

  test "should show lac_temperature" do
    get :show, id: @lac_temperature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lac_temperature
    assert_response :success
  end

  test "should update lac_temperature" do
    put :update, id: @lac_temperature, lac_temperature: { temperature: @lac_temperature.temperature, when: @lac_temperature.when }
    assert_redirected_to lac_temperature_path(assigns(:lac_temperature))
  end

  test "should destroy lac_temperature" do
    assert_difference('LacTemperature.count', -1) do
      delete :destroy, id: @lac_temperature
    end

    assert_redirected_to lac_temperatures_path
  end
end
