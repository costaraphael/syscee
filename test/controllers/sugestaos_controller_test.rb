require 'test_helper'

class SugestaosControllerTest < ActionController::TestCase
  setup do
    @sugestao = sugestaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sugestoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sugestao" do
    assert_difference('Sugestao.count') do
      post :create, sugestao: {  }
    end

    assert_redirected_to sugestao_path(assigns(:sugestao))
  end

  test "should show sugestao" do
    get :show, id: @sugestao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sugestao
    assert_response :success
  end

  test "should update sugestao" do
    patch :update, id: @sugestao, sugestao: {  }
    assert_redirected_to sugestao_path(assigns(:sugestao))
  end

  test "should destroy sugestao" do
    assert_difference('Sugestao.count', -1) do
      delete :destroy, id: @sugestao
    end

    assert_redirected_to sugestaos_path
  end
end
