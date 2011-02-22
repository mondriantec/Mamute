require 'test_helper'

class NoticacaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:noticacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noticacao" do
    assert_difference('Noticacao.count') do
      post :create, :noticacao => { }
    end

    assert_redirected_to noticacao_path(assigns(:noticacao))
  end

  test "should show noticacao" do
    get :show, :id => noticacaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => noticacaos(:one).to_param
    assert_response :success
  end

  test "should update noticacao" do
    put :update, :id => noticacaos(:one).to_param, :noticacao => { }
    assert_redirected_to noticacao_path(assigns(:noticacao))
  end

  test "should destroy noticacao" do
    assert_difference('Noticacao.count', -1) do
      delete :destroy, :id => noticacaos(:one).to_param
    end

    assert_redirected_to noticacaos_path
  end
end
