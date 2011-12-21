require 'test_helper'

class ModelosDeNotificacaoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modelos_de_notificacao)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modelo_de_notificacao" do
    assert_difference('ModeloDeNotificacao.count') do
      post :create, :modelo_de_notificacao => { }
    end

    assert_redirected_to modelo_de_notificacao_path(assigns(:modelo_de_notificacao))
  end

  test "should show modelo_de_notificacao" do
    get :show, :id => modelos_de_notificacao(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => modelos_de_notificacao(:one).to_param
    assert_response :success
  end

  test "should update modelo_de_notificacao" do
    put :update, :id => modelos_de_notificacao(:one).to_param, :modelo_de_notificacao => { }
    assert_redirected_to modelo_de_notificacao_path(assigns(:modelo_de_notificacao))
  end

  test "should destroy modelo_de_notificacao" do
    assert_difference('ModeloDeNotificacao.count', -1) do
      delete :destroy, :id => modelos_de_notificacao(:one).to_param
    end

    assert_redirected_to modelos_de_notificacao_path
  end
end
