require 'test_helper'

class ObjetosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objeto = objetos(:one)
  end

  test "should get index" do
    get objetos_url
    assert_response :success
  end

  test "should get new" do
    get new_objeto_url
    assert_response :success
  end

  test "should create objeto" do
    assert_difference('Objeto.count') do
      post objetos_url, params: { objeto: { nombre: @objeto.nombre, proceso: @objeto.proceso, tipo_proceso: @objeto.tipo_proceso } }
    end

    assert_redirected_to objeto_url(Objeto.last)
  end

  test "should show objeto" do
    get objeto_url(@objeto)
    assert_response :success
  end

  test "should get edit" do
    get edit_objeto_url(@objeto)
    assert_response :success
  end

  test "should update objeto" do
    patch objeto_url(@objeto), params: { objeto: { nombre: @objeto.nombre, proceso: @objeto.proceso, tipo_proceso: @objeto.tipo_proceso } }
    assert_redirected_to objeto_url(@objeto)
  end

  test "should destroy objeto" do
    assert_difference('Objeto.count', -1) do
      delete objeto_url(@objeto)
    end

    assert_redirected_to objetos_url
  end
end
