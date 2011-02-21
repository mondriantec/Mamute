require 'test_helper'

class ConveniadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conveniados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conveniado" do
    assert_difference('Conveniado.count') do
      post :create, :conveniado => { }
    end

    assert_redirected_to conveniado_path(assigns(:conveniado))
  end

  test "should show conveniado" do
    get :show, :id => conveniados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => conveniados(:one).to_param
    assert_response :success
  end

  test "should update conveniado" do
    put :update, :id => conveniados(:one).to_param, :conveniado => { }
    assert_redirected_to conveniado_path(assigns(:conveniado))
  end

  test "should destroy conveniado" do
    assert_difference('Conveniado.count', -1) do
      delete :destroy, :id => conveniados(:one).to_param
    end

    assert_redirected_to conveniados_path
  end
end
