json.extract! proceso_detalle, :id, :numero, :lugar, :fecha_entrada, :fecha_salida, :created_at, :updated_at
json.url proceso_detalle_url(proceso_detalle, format: :json)
