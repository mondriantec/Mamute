require 'test_helper'

class IrtdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irtds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irtd" do
    assert_difference('Irtd.count') do
      post :create, :irtd => { }
    end

    assert_redirected_to irtd_path(assigns(:irtd))
  end

  test "should show irtd" do
    get :show, :id => irtds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => irtds(:one).to_param
    assert_response :success
  end

  test "should update irtd" do
    put :update, :id => irtds(:one).to_param, :irtd => { }
    assert_redirected_to irtd_path(assigns(:irtd))
  end

  test "should destroy irtd" do
    assert_difference('Irtd.count', -1) do
      delete :destroy, :id => irtds(:one).to_param
    end

    assert_redirected_to irtds_path
  end
end
