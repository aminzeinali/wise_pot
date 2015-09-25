require 'test_helper'

class PlantsControllerTest < ActionController::TestCase
  setup do
    @plant = plants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant" do
    assert_difference('Plant.count') do
      post :create, plant: { age: @plant.age, description: @plant.description, health_factor: @plant.health_factor, height: @plant.height, humidity_air: @plant.humidity_air, humidity_soil: @plant.humidity_soil, image: @plant.image, light_degree: @plant.light_degree, name: @plant.name, race: @plant.race, temperature: @plant.temperature }
    end

    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should show plant" do
    get :show, id: @plant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plant
    assert_response :success
  end

  test "should update plant" do
    patch :update, id: @plant, plant: { age: @plant.age, description: @plant.description, health_factor: @plant.health_factor, height: @plant.height, humidity_air: @plant.humidity_air, humidity_soil: @plant.humidity_soil, image: @plant.image, light_degree: @plant.light_degree, name: @plant.name, race: @plant.race, temperature: @plant.temperature }
    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should destroy plant" do
    assert_difference('Plant.count', -1) do
      delete :destroy, id: @plant
    end

    assert_redirected_to plants_path
  end
end
