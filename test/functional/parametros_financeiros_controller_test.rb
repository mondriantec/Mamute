require 'test_helper'

class ParametrosFinanceirosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametros_financeiros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametro_financeiro" do
    assert_difference('ParametroFinanceiro.count') do
      post :create, :parametro_financeiro => { }
    end

    assert_redirected_to parametro_financeiro_path(assigns(:parametro_financeiro))
  end

  test "should show parametro_financeiro" do
    get :show, :id => parametros_financeiros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => parametros_financeiros(:one).to_param
    assert_response :success
  end

  test "should update parametro_financeiro" do
    put :update, :id => parametros_financeiros(:one).to_param, :parametro_financeiro => { }
    assert_redirected_to parametro_financeiro_path(assigns(:parametro_financeiro))
  end

  test "should destroy parametro_financeiro" do
    assert_difference('ParametroFinanceiro.count', -1) do
      delete :destroy, :id => parametros_financeiros(:one).to_param
    end

    assert_redirected_to parametros_financeiros_path
  end
end
