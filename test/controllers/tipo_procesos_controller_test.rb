require 'test_helper'

class TipoProcesosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_proceso = tipo_procesos(:one)
  end

  test "should get index" do
    get tipo_procesos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_proceso_url
    assert_response :success
  end

  test "should create tipo_proceso" do
    assert_difference('TipoProceso.count') do
      post tipo_procesos_url, params: { tipo_proceso: { nombre: @tipo_proceso.nombre } }
    end

    assert_redirected_to tipo_proceso_url(TipoProceso.last)
  end

  test "should show tipo_proceso" do
    get tipo_proceso_url(@tipo_proceso)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_proceso_url(@tipo_proceso)
    assert_response :success
  end

  test "should update tipo_proceso" do
    patch tipo_proceso_url(@tipo_proceso), params: { tipo_proceso: { nombre: @tipo_proceso.nombre } }
    assert_redirected_to tipo_proceso_url(@tipo_proceso)
  end

  test "should destroy tipo_proceso" do
    assert_difference('TipoProceso.count', -1) do
      delete tipo_proceso_url(@tipo_proceso)
    end

    assert_redirected_to tipo_procesos_url
  end
end
