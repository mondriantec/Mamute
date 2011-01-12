require 'test_helper'

class ValorCampoDocumentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valor_campo_documentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valor_campo_documento" do
    assert_difference('ValorCampoDocumento.count') do
      post :create, :valor_campo_documento => { }
    end

    assert_redirected_to valor_campo_documento_path(assigns(:valor_campo_documento))
  end

  test "should show valor_campo_documento" do
    get :show, :id => valor_campo_documentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => valor_campo_documentos(:one).to_param
    assert_response :success
  end

  test "should update valor_campo_documento" do
    put :update, :id => valor_campo_documentos(:one).to_param, :valor_campo_documento => { }
    assert_redirected_to valor_campo_documento_path(assigns(:valor_campo_documento))
  end

  test "should destroy valor_campo_documento" do
    assert_difference('ValorCampoDocumento.count', -1) do
      delete :destroy, :id => valor_campo_documentos(:one).to_param
    end

    assert_redirected_to valor_campo_documentos_path
  end
end
