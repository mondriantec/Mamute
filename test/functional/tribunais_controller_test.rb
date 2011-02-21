require 'test_helper'

class TribunaisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tribunais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tribunal" do
    assert_difference('Tribunal.count') do
      post :create, :tribunal => { }
    end

    assert_redirected_to tribunal_path(assigns(:tribunal))
  end

  test "should show tribunal" do
    get :show, :id => tribunais(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tribunais(:one).to_param
    assert_response :success
  end

  test "should update tribunal" do
    put :update, :id => tribunais(:one).to_param, :tribunal => { }
    assert_redirected_to tribunal_path(assigns(:tribunal))
  end

  test "should destroy tribunal" do
    assert_difference('Tribunal.count', -1) do
      delete :destroy, :id => tribunais(:one).to_param
    end

    assert_redirected_to tribunais_path
  end
end
