require 'test_helper'

class LotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lote" do
    assert_difference('Lote.count') do
      post :create, :lote => { }
    end

    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should show lote" do
    get :show, :id => lotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lotes(:one).to_param
    assert_response :success
  end

  test "should update lote" do
    put :update, :id => lotes(:one).to_param, :lote => { }
    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should destroy lote" do
    assert_difference('Lote.count', -1) do
      delete :destroy, :id => lotes(:one).to_param
    end

    assert_redirected_to lotes_path
  end
end
