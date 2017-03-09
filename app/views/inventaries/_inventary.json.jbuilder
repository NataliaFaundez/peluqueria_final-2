json.extract! inventary, :id, :nombre, :codigo, :cantidad, :estado, :marca, :created_at, :updated_at
json.url inventary_url(inventary, format: :json)