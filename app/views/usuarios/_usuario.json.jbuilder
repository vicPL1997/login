json.extract! usuario, :id, :nombre, :apellidos, :datos, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
