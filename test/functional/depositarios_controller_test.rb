require 'test_helper'

class DepositariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:depositarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create depositario" do
    assert_difference('Depositario.count') do
      post :create, :depositario => { }
    end

    assert_redirected_to depositario_path(assigns(:depositario))
  end

  test "should show depositario" do
    get :show, :id => depositarios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => depositarios(:one).to_param
    assert_response :success
  end

  test "should update depositario" do
    put :update, :id => depositarios(:one).to_param, :depositario => { }
    assert_redirected_to depositario_path(assigns(:depositario))
  end

  test "should destroy depositario" do
    assert_difference('Depositario.count', -1) do
      delete :destroy, :id => depositarios(:one).to_param
    end

    assert_redirected_to depositarios_path
  end
end
