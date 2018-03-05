require 'test_helper'

class ActuacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actuacion = actuaciones(:one)
  end

  test "should get index" do
    get actuaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_actuacion_url
    assert_response :success
  end

  test "should create actuacion" do
    assert_difference('Actuacion.count') do
      post actuaciones_url, params: { actuacion: { descripcion: @actuacion.descripcion, fecha: @actuacion.fecha, numero: @actuacion.numero, tipo: @actuacion.tipo } }
    end

    assert_redirected_to actuacion_url(Actuacion.last)
  end

  test "should show actuacion" do
    get actuacion_url(@actuacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_actuacion_url(@actuacion)
    assert_response :success
  end

  test "should update actuacion" do
    patch actuacion_url(@actuacion), params: { actuacion: { descripcion: @actuacion.descripcion, fecha: @actuacion.fecha, numero: @actuacion.numero, tipo: @actuacion.tipo } }
    assert_redirected_to actuacion_url(@actuacion)
  end

  test "should destroy actuacion" do
    assert_difference('Actuacion.count', -1) do
      delete actuacion_url(@actuacion)
    end

    assert_redirected_to actuaciones_url
  end
end
