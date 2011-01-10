require 'test_helper'

class MotivoNotificacaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_notificacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_notificacao" do
    assert_difference('MotivoNotificacao.count') do
      post :create, :motivo_notificacao => { }
    end

    assert_redirected_to motivo_notificacao_path(assigns(:motivo_notificacao))
  end

  test "should show motivo_notificacao" do
    get :show, :id => motivo_notificacaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => motivo_notificacaos(:one).to_param
    assert_response :success
  end

  test "should update motivo_notificacao" do
    put :update, :id => motivo_notificacaos(:one).to_param, :motivo_notificacao => { }
    assert_redirected_to motivo_notificacao_path(assigns(:motivo_notificacao))
  end

  test "should destroy motivo_notificacao" do
    assert_difference('MotivoNotificacao.count', -1) do
      delete :destroy, :id => motivo_notificacaos(:one).to_param
    end

    assert_redirected_to motivo_notificacaos_path
  end
end
