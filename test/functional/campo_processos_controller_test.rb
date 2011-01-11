require 'test_helper'

class CampoProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campo_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campo_processo" do
    assert_difference('CampoProcesso.count') do
      post :create, :campo_processo => { }
    end

    assert_redirected_to campo_processo_path(assigns(:campo_processo))
  end

  test "should show campo_processo" do
    get :show, :id => campo_processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => campo_processos(:one).to_param
    assert_response :success
  end

  test "should update campo_processo" do
    put :update, :id => campo_processos(:one).to_param, :campo_processo => { }
    assert_redirected_to campo_processo_path(assigns(:campo_processo))
  end

  test "should destroy campo_processo" do
    assert_difference('CampoProcesso.count', -1) do
      delete :destroy, :id => campo_processos(:one).to_param
    end

    assert_redirected_to campo_processos_path
  end
end
