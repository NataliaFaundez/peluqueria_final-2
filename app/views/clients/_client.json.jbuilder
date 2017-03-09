json.extract! client, :id, :nombre, :apellido, :rut, :email, :telefono, :created_at, :updated_at
json.url client_url(client, format: :json)