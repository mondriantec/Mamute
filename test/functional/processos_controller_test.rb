require 'test_helper'

class ProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processo" do
    assert_difference('Processo.count') do
      post :create, :processo => { }
    end

    assert_redirected_to processo_path(assigns(:processo))
  end

  test "should show processo" do
    get :show, :id => processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => processos(:one).to_param
    assert_response :success
  end

  test "should update processo" do
    put :update, :id => processos(:one).to_param, :processo => { }
    assert_redirected_to processo_path(assigns(:processo))
  end

  test "should destroy processo" do
    assert_difference('Processo.count', -1) do
      delete :destroy, :id => processos(:one).to_param
    end

    assert_redirected_to processos_path
  end
end
