json.extract! proceso_detalle, :id, :etapa, :estado, :fecha, :created_at, :updated_at
json.url proceso_detalle_url(proceso_detalle, format: :json)
