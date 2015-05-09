require 'test_helper'

class DataLogsControllerTest < ActionController::TestCase
  setup do
    @data_log = data_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_log" do
    assert_difference('DataLog.count') do
      post :create, data_log: { humidity_air: @data_log.humidity_air, humidity_soil: @data_log.humidity_soil, light: @data_log.light, plant_id: @data_log.plant_id, temperature: @data_log.temperature, user_id: @data_log.user_id }
    end

    assert_redirected_to data_log_path(assigns(:data_log))
  end

  test "should show data_log" do
    get :show, id: @data_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_log
    assert_response :success
  end

  test "should update data_log" do
    patch :update, id: @data_log, data_log: { humidity_air: @data_log.humidity_air, humidity_soil: @data_log.humidity_soil, light: @data_log.light, plant_id: @data_log.plant_id, temperature: @data_log.temperature, user_id: @data_log.user_id }
    assert_redirected_to data_log_path(assigns(:data_log))
  end

  test "should destroy data_log" do
    assert_difference('DataLog.count', -1) do
      delete :destroy, id: @data_log
    end

    assert_redirected_to data_logs_path
  end
end
