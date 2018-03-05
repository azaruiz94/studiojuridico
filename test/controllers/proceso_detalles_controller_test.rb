require 'test_helper'

class ProcesoDetallesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proceso_detalle = proceso_detalles(:one)
  end

  test "should get index" do
    get proceso_detalles_url
    assert_response :success
  end

  test "should get new" do
    get new_proceso_detalle_url
    assert_response :success
  end

  test "should create proceso_detalle" do
    assert_difference('ProcesoDetalle.count') do
      post proceso_detalles_url, params: { proceso_detalle: { fecha_entrada: @proceso_detalle.fecha_entrada, fecha_salida: @proceso_detalle.fecha_salida, lugar: @proceso_detalle.lugar, numero: @proceso_detalle.numero } }
    end

    assert_redirected_to proceso_detalle_url(ProcesoDetalle.last)
  end

  test "should show proceso_detalle" do
    get proceso_detalle_url(@proceso_detalle)
    assert_response :success
  end

  test "should get edit" do
    get edit_proceso_detalle_url(@proceso_detalle)
    assert_response :success
  end

  test "should update proceso_detalle" do
    patch proceso_detalle_url(@proceso_detalle), params: { proceso_detalle: { fecha_entrada: @proceso_detalle.fecha_entrada, fecha_salida: @proceso_detalle.fecha_salida, lugar: @proceso_detalle.lugar, numero: @proceso_detalle.numero } }
    assert_redirected_to proceso_detalle_url(@proceso_detalle)
  end

  test "should destroy proceso_detalle" do
    assert_difference('ProcesoDetalle.count', -1) do
      delete proceso_detalle_url(@proceso_detalle)
    end

    assert_redirected_to proceso_detalles_url
  end
end
