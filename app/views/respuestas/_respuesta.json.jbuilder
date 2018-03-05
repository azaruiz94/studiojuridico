json.extract! respuesta, :id, :memo, :fecha, :medios, :descripcion, :created_at, :updated_at
json.url respuesta_url(respuesta, format: :json)
