require 'test_helper'

class SubDepositariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_depositarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_depositario" do
    assert_difference('SubDepositario.count') do
      post :create, :sub_depositario => { }
    end

    assert_redirected_to sub_depositario_path(assigns(:sub_depositario))
  end

  test "should show sub_depositario" do
    get :show, :id => sub_depositarios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sub_depositarios(:one).to_param
    assert_response :success
  end

  test "should update sub_depositario" do
    put :update, :id => sub_depositarios(:one).to_param, :sub_depositario => { }
    assert_redirected_to sub_depositario_path(assigns(:sub_depositario))
  end

  test "should destroy sub_depositario" do
    assert_difference('SubDepositario.count', -1) do
      delete :destroy, :id => sub_depositarios(:one).to_param
    end

    assert_redirected_to sub_depositarios_path
  end
end
