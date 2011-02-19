require 'test_helper'

class CertidaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certidaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certidao" do
    assert_difference('Certidao.count') do
      post :create, :certidao => { }
    end

    assert_redirected_to certidao_path(assigns(:certidao))
  end

  test "should show certidao" do
    get :show, :id => certidaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => certidaos(:one).to_param
    assert_response :success
  end

  test "should update certidao" do
    put :update, :id => certidaos(:one).to_param, :certidao => { }
    assert_redirected_to certidao_path(assigns(:certidao))
  end

  test "should destroy certidao" do
    assert_difference('Certidao.count', -1) do
      delete :destroy, :id => certidaos(:one).to_param
    end

    assert_redirected_to certidaos_path
  end
end
