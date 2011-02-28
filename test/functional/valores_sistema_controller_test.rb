require 'test_helper'

class ValoresSistemaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valores_sistema)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valor_sistema" do
    assert_difference('ValorSistema.count') do
      post :create, :valor_sistema => { }
    end

    assert_redirected_to valor_sistema_path(assigns(:valor_sistema))
  end

  test "should show valor_sistema" do
    get :show, :id => valores_sistema(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => valores_sistema(:one).to_param
    assert_response :success
  end

  test "should update valor_sistema" do
    put :update, :id => valores_sistema(:one).to_param, :valor_sistema => { }
    assert_redirected_to valor_sistema_path(assigns(:valor_sistema))
  end

  test "should destroy valor_sistema" do
    assert_difference('ValorSistema.count', -1) do
      delete :destroy, :id => valores_sistema(:one).to_param
    end

    assert_redirected_to valores_sistema_path
  end
end
