require 'test_helper'

class OperativePlansControllerTest < ActionController::TestCase
  setup do
    @operative_plan = operative_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operative_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operative_plan" do
    assert_difference('OperativePlan.count') do
      post :create, operative_plan: { description: @operative_plan.description, title: @operative_plan.title }
    end

    assert_redirected_to operative_plan_path(assigns(:operative_plan))
  end

  test "should show operative_plan" do
    get :show, id: @operative_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operative_plan
    assert_response :success
  end

  test "should update operative_plan" do
    patch :update, id: @operative_plan, operative_plan: { description: @operative_plan.description, title: @operative_plan.title }
    assert_redirected_to operative_plan_path(assigns(:operative_plan))
  end

  test "should destroy operative_plan" do
    assert_difference('OperativePlan.count', -1) do
      delete :destroy, id: @operative_plan
    end

    assert_redirected_to operative_plans_path
  end
end
