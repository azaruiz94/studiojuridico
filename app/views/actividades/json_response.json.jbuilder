json.array!(@actividades) do |actividad|
  json.extract! actividad, :id
  json.title actividad.nombre
  json.description actividad.descripcion
  json.start actividad.inicio
  json.end actividad.fin
  json.url actividad_url(actividad, format: :html)
end