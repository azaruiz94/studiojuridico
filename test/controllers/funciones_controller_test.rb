require 'test_helper'

class FuncionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funcion = funciones(:one)
  end

  test "should get index" do
    get funciones_url
    assert_response :success
  end

  test "should get new" do
    get new_funcion_url
    assert_response :success
  end

  test "should create funcion" do
    assert_difference('Funcion.count') do
      post funciones_url, params: { funcion: { nombre: @funcion.nombre } }
    end

    assert_redirected_to funcion_url(Funcion.last)
  end

  test "should show funcion" do
    get funcion_url(@funcion)
    assert_response :success
  end

  test "should get edit" do
    get edit_funcion_url(@funcion)
    assert_response :success
  end

  test "should update funcion" do
    patch funcion_url(@funcion), params: { funcion: { nombre: @funcion.nombre } }
    assert_redirected_to funcion_url(@funcion)
  end

  test "should destroy funcion" do
    assert_difference('Funcion.count', -1) do
      delete funcion_url(@funcion)
    end

    assert_redirected_to funciones_url
  end
end
