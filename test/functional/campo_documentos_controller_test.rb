require 'test_helper'

class CampoDocumentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campo_documentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campo_documento" do
    assert_difference('CampoDocumento.count') do
      post :create, :campo_documento => { }
    end

    assert_redirected_to campo_documento_path(assigns(:campo_documento))
  end

  test "should show campo_documento" do
    get :show, :id => campo_documentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => campo_documentos(:one).to_param
    assert_response :success
  end

  test "should update campo_documento" do
    put :update, :id => campo_documentos(:one).to_param, :campo_documento => { }
    assert_redirected_to campo_documento_path(assigns(:campo_documento))
  end

  test "should destroy campo_documento" do
    assert_difference('CampoDocumento.count', -1) do
      delete :destroy, :id => campo_documentos(:one).to_param
    end

    assert_redirected_to campo_documentos_path
  end
end
