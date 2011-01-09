require 'test_helper'

class CartoriosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cartorio" do
    assert_difference('Cartorio.count') do
      post :create, :cartorio => { }
    end

    assert_redirected_to cartorio_path(assigns(:cartorio))
  end

  test "should show cartorio" do
    get :show, :id => cartorios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cartorios(:one).to_param
    assert_response :success
  end

  test "should update cartorio" do
    put :update, :id => cartorios(:one).to_param, :cartorio => { }
    assert_redirected_to cartorio_path(assigns(:cartorio))
  end

  test "should destroy cartorio" do
    assert_difference('Cartorio.count', -1) do
      delete :destroy, :id => cartorios(:one).to_param
    end

    assert_redirected_to cartorios_path
  end
end
