require 'test_helper'

class SelosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selo" do
    assert_difference('Selo.count') do
      post :create, :selo => { }
    end

    assert_redirected_to selo_path(assigns(:selo))
  end

  test "should show selo" do
    get :show, :id => selos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => selos(:one).to_param
    assert_response :success
  end

  test "should update selo" do
    put :update, :id => selos(:one).to_param, :selo => { }
    assert_redirected_to selo_path(assigns(:selo))
  end

  test "should destroy selo" do
    assert_difference('Selo.count', -1) do
      delete :destroy, :id => selos(:one).to_param
    end

    assert_redirected_to selos_path
  end
end
