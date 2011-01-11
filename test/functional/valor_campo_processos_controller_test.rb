require 'test_helper'

class ValorCampoProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valor_campo_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valor_campo_processo" do
    assert_difference('ValorCampoProcesso.count') do
      post :create, :valor_campo_processo => { }
    end

    assert_redirected_to valor_campo_processo_path(assigns(:valor_campo_processo))
  end

  test "should show valor_campo_processo" do
    get :show, :id => valor_campo_processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => valor_campo_processos(:one).to_param
    assert_response :success
  end

  test "should update valor_campo_processo" do
    put :update, :id => valor_campo_processos(:one).to_param, :valor_campo_processo => { }
    assert_redirected_to valor_campo_processo_path(assigns(:valor_campo_processo))
  end

  test "should destroy valor_campo_processo" do
    assert_difference('ValorCampoProcesso.count', -1) do
      delete :destroy, :id => valor_campo_processos(:one).to_param
    end

    assert_redirected_to valor_campo_processos_path
  end
end
