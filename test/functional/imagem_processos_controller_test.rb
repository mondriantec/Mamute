require 'test_helper'

class ImagemProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imagem_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imagem_processo" do
    assert_difference('ImagemProcesso.count') do
      post :create, :imagem_processo => { }
    end

    assert_redirected_to imagem_processo_path(assigns(:imagem_processo))
  end

  test "should show imagem_processo" do
    get :show, :id => imagem_processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imagem_processos(:one).to_param
    assert_response :success
  end

  test "should update imagem_processo" do
    put :update, :id => imagem_processos(:one).to_param, :imagem_processo => { }
    assert_redirected_to imagem_processo_path(assigns(:imagem_processo))
  end

  test "should destroy imagem_processo" do
    assert_difference('ImagemProcesso.count', -1) do
      delete :destroy, :id => imagem_processos(:one).to_param
    end

    assert_redirected_to imagem_processos_path
  end
end
