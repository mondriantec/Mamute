require 'test_helper'

class PlanosDeContaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planos_de_conta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plano_de_conta" do
    assert_difference('PlanoDeConta.count') do
      post :create, :plano_de_conta => { }
    end

    assert_redirected_to plano_de_conta_path(assigns(:plano_de_conta))
  end

  test "should show plano_de_conta" do
    get :show, :id => planos_de_conta(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => planos_de_conta(:one).to_param
    assert_response :success
  end

  test "should update plano_de_conta" do
    put :update, :id => planos_de_conta(:one).to_param, :plano_de_conta => { }
    assert_redirected_to plano_de_conta_path(assigns(:plano_de_conta))
  end

  test "should destroy plano_de_conta" do
    assert_difference('PlanoDeConta.count', -1) do
      delete :destroy, :id => planos_de_conta(:one).to_param
    end

    assert_redirected_to planos_de_conta_path
  end
end
