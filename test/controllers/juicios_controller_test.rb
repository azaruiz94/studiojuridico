require 'test_helper'

class JuiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @juicio = juicios(:one)
  end

  test "should get index" do
    get juicios_url
    assert_response :success
  end

  test "should get new" do
    get new_juicio_url
    assert_response :success
  end

  test "should create juicio" do
    assert_difference('Juicio.count') do
      post juicios_url, params: { juicio: { caratula: @juicio.caratula, exp_numero: @juicio.exp_numero, fiscal: @juicio.fiscal, proceso: @juicio.proceso, tipo_proceso: @juicio.tipo_proceso } }
    end

    assert_redirected_to juicio_url(Juicio.last)
  end

  test "should show juicio" do
    get juicio_url(@juicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_juicio_url(@juicio)
    assert_response :success
  end

  test "should update juicio" do
    patch juicio_url(@juicio), params: { juicio: { caratula: @juicio.caratula, exp_numero: @juicio.exp_numero, fiscal: @juicio.fiscal, proceso: @juicio.proceso, tipo_proceso: @juicio.tipo_proceso } }
    assert_redirected_to juicio_url(@juicio)
  end

  test "should destroy juicio" do
    assert_difference('Juicio.count', -1) do
      delete juicio_url(@juicio)
    end

    assert_redirected_to juicios_url
  end
end
