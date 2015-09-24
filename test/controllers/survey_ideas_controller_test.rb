require 'test_helper'

class SurveyIdeasControllerTest < ActionController::TestCase
  setup do
    @survey_idea = survey_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_idea" do
    assert_difference('SurveyIdea.count') do
      post :create, survey_idea: { age: @survey_idea.age, gender: @survey_idea.gender, idea1: @survey_idea.idea1, idea2: @survey_idea.idea2, idea3: @survey_idea.idea3, idea4: @survey_idea.idea4, idea5: @survey_idea.idea5 }
    end

    assert_redirected_to survey_idea_path(assigns(:survey_idea))
  end

  test "should show survey_idea" do
    get :show, id: @survey_idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_idea
    assert_response :success
  end

  test "should update survey_idea" do
    patch :update, id: @survey_idea, survey_idea: { age: @survey_idea.age, gender: @survey_idea.gender, idea1: @survey_idea.idea1, idea2: @survey_idea.idea2, idea3: @survey_idea.idea3, idea4: @survey_idea.idea4, idea5: @survey_idea.idea5 }
    assert_redirected_to survey_idea_path(assigns(:survey_idea))
  end

  test "should destroy survey_idea" do
    assert_difference('SurveyIdea.count', -1) do
      delete :destroy, id: @survey_idea
    end

    assert_redirected_to survey_ideas_path
  end
end
