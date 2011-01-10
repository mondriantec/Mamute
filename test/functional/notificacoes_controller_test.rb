require 'test_helper'

class NotificacoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacao" do
    assert_difference('Notificacao.count') do
      post :create, :notificacao => { }
    end

    assert_redirected_to notificacao_path(assigns(:notificacao))
  end

  test "should show notificacao" do
    get :show, :id => notificacoes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => notificacoes(:one).to_param
    assert_response :success
  end

  test "should update notificacao" do
    put :update, :id => notificacoes(:one).to_param, :notificacao => { }
    assert_redirected_to notificacao_path(assigns(:notificacao))
  end

  test "should destroy notificacao" do
    assert_difference('Notificacao.count', -1) do
      delete :destroy, :id => notificacoes(:one).to_param
    end

    assert_redirected_to notificacoes_path
  end
end
