require 'test_helper'

class ConfiguracoesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configuracoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create configuracao" do
    assert_difference('Configuracao.count') do
      post :create, :configuracao => { }
    end

    assert_redirected_to configuracao_path(assigns(:configuracao))
  end

  test "should show configuracao" do
    get :show, :id => configuracoes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => configuracoes(:one).to_param
    assert_response :success
  end

  test "should update configuracao" do
    put :update, :id => configuracoes(:one).to_param, :configuracao => { }
    assert_redirected_to configuracao_path(assigns(:configuracao))
  end

  test "should destroy configuracao" do
    assert_difference('Configuracao.count', -1) do
      delete :destroy, :id => configuracoes(:one).to_param
    end

    assert_redirected_to configuracoes_path
  end
end
