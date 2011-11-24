require 'test_helper'

class ArquivoPagamentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arquivo_pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arquivo_pagamento" do
    assert_difference('ArquivoPagamento.count') do
      post :create, :arquivo_pagamento => { }
    end

    assert_redirected_to arquivo_pagamento_path(assigns(:arquivo_pagamento))
  end

  test "should show arquivo_pagamento" do
    get :show, :id => arquivo_pagamentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => arquivo_pagamentos(:one).to_param
    assert_response :success
  end

  test "should update arquivo_pagamento" do
    put :update, :id => arquivo_pagamentos(:one).to_param, :arquivo_pagamento => { }
    assert_redirected_to arquivo_pagamento_path(assigns(:arquivo_pagamento))
  end

  test "should destroy arquivo_pagamento" do
    assert_difference('ArquivoPagamento.count', -1) do
      delete :destroy, :id => arquivo_pagamentos(:one).to_param
    end

    assert_redirected_to arquivo_pagamentos_path
  end
end
