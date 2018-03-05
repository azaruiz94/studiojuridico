json.extract! actuacion, :id, :numero, :fecha, :descripcion, :tipo, :created_at, :updated_at
json.url actuacion_url(actuacion, format: :json)
