require 'test_helper'

class PrecosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:precos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preco" do
    assert_difference('Preco.count') do
      post :create, :preco => { }
    end

    assert_redirected_to preco_path(assigns(:preco))
  end

  test "should show preco" do
    get :show, :id => precos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => precos(:one).to_param
    assert_response :success
  end

  test "should update preco" do
    put :update, :id => precos(:one).to_param, :preco => { }
    assert_redirected_to preco_path(assigns(:preco))
  end

  test "should destroy preco" do
    assert_difference('Preco.count', -1) do
      delete :destroy, :id => precos(:one).to_param
    end

    assert_redirected_to precos_path
  end
end
