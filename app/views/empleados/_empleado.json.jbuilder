json.extract! empleado, :id, :nombre, :direccion, :telefono, :email, :ruc, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
