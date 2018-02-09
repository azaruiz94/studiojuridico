json.extract! cliente, :id, :nombre, :direccion, :telefono, :email, :ruc, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
