require 'test_helper'

class TipoProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_processo" do
    assert_difference('TipoProcesso.count') do
      post :create, :tipo_processo => { }
    end

    assert_redirected_to tipo_processo_path(assigns(:tipo_processo))
  end

  test "should show tipo_processo" do
    get :show, :id => tipo_processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_processos(:one).to_param
    assert_response :success
  end

  test "should update tipo_processo" do
    put :update, :id => tipo_processos(:one).to_param, :tipo_processo => { }
    assert_redirected_to tipo_processo_path(assigns(:tipo_processo))
  end

  test "should destroy tipo_processo" do
    assert_difference('TipoProcesso.count', -1) do
      delete :destroy, :id => tipo_processos(:one).to_param
    end

    assert_redirected_to tipo_processos_path
  end
end
