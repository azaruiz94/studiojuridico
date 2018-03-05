require 'test_helper'

class ListadoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listado_index_url
    assert_response :success
  end

end
