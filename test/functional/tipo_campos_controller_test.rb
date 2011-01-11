require 'test_helper'

class TipoCamposControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_campos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_campo" do
    assert_difference('TipoCampo.count') do
      post :create, :tipo_campo => { }
    end

    assert_redirected_to tipo_campo_path(assigns(:tipo_campo))
  end

  test "should show tipo_campo" do
    get :show, :id => tipo_campos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_campos(:one).to_param
    assert_response :success
  end

  test "should update tipo_campo" do
    put :update, :id => tipo_campos(:one).to_param, :tipo_campo => { }
    assert_redirected_to tipo_campo_path(assigns(:tipo_campo))
  end

  test "should destroy tipo_campo" do
    assert_difference('TipoCampo.count', -1) do
      delete :destroy, :id => tipo_campos(:one).to_param
    end

    assert_redirected_to tipo_campos_path
  end
end
