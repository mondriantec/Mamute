require 'test_helper'

class TiposDeDocumentoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_documento)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_de_documento" do
    assert_difference('TipoDeDocumento.count') do
      post :create, :tipo_de_documento => { }
    end

    assert_redirected_to tipo_de_documento_path(assigns(:tipo_de_documento))
  end

  test "should show tipo_de_documento" do
    get :show, :id => tipos_de_documento(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipos_de_documento(:one).to_param
    assert_response :success
  end

  test "should update tipo_de_documento" do
    put :update, :id => tipos_de_documento(:one).to_param, :tipo_de_documento => { }
    assert_redirected_to tipo_de_documento_path(assigns(:tipo_de_documento))
  end

  test "should destroy tipo_de_documento" do
    assert_difference('TipoDeDocumento.count', -1) do
      delete :destroy, :id => tipos_de_documento(:one).to_param
    end

    assert_redirected_to tipos_de_documento_path
  end
end
