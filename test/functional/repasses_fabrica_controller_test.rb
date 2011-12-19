require 'test_helper'

class RepassesFabricaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repasses_fabrica)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repasse_fabrica" do
    assert_difference('RepasseFabrica.count') do
      post :create, :repasse_fabrica => { }
    end

    assert_redirected_to repasse_fabrica_path(assigns(:repasse_fabrica))
  end

  test "should show repasse_fabrica" do
    get :show, :id => repasses_fabrica(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => repasses_fabrica(:one).to_param
    assert_response :success
  end

  test "should update repasse_fabrica" do
    put :update, :id => repasses_fabrica(:one).to_param, :repasse_fabrica => { }
    assert_redirected_to repasse_fabrica_path(assigns(:repasse_fabrica))
  end

  test "should destroy repasse_fabrica" do
    assert_difference('RepasseFabrica.count', -1) do
      delete :destroy, :id => repasses_fabrica(:one).to_param
    end

    assert_redirected_to repasses_fabrica_path
  end
end
