require 'test_helper'

class PlantersControllerTest < ActionController::TestCase
  setup do
    @planter = planters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planter" do
    assert_difference('Planter.count') do
      post :create, planter: { brief_desc: @planter.brief_desc }
    end

    assert_redirected_to planter_path(assigns(:planter))
  end

  test "should show planter" do
    get :show, id: @planter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planter
    assert_response :success
  end

  test "should update planter" do
    patch :update, id: @planter, planter: { brief_desc: @planter.brief_desc }
    assert_redirected_to planter_path(assigns(:planter))
  end

  test "should destroy planter" do
    assert_difference('Planter.count', -1) do
      delete :destroy, id: @planter
    end

    assert_redirected_to planters_path
  end
end
