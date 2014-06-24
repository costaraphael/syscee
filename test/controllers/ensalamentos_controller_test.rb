require 'test_helper'

class EnsalamentosControllerTest < ActionController::TestCase
  setup do
    @ensalamento = ensalamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ensalamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ensalamento" do
    assert_difference('Ensalamento.count') do
      post :create, ensalamento: { alunos: @ensalamento.alunos, disciplina_id: @ensalamento.disciplina_id, final: @ensalamento.final, periodo_id: @ensalamento.periodo_id, sala_id: @ensalamento.sala_id }
    end

    assert_redirected_to ensalamento_path(assigns(:ensalamento))
  end

  test "should show ensalamento" do
    get :show, id: @ensalamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ensalamento
    assert_response :success
  end

  test "should update ensalamento" do
    patch :update, id: @ensalamento, ensalamento: { alunos: @ensalamento.alunos, disciplina_id: @ensalamento.disciplina_id, final: @ensalamento.final, periodo_id: @ensalamento.periodo_id, sala_id: @ensalamento.sala_id }
    assert_redirected_to ensalamento_path(assigns(:ensalamento))
  end

  test "should destroy ensalamento" do
    assert_difference('Ensalamento.count', -1) do
      delete :destroy, id: @ensalamento
    end

    assert_redirected_to ensalamentos_path
  end
end
