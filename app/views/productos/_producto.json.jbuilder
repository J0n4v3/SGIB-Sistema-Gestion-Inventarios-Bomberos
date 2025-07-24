json.extract! producto, :id, :nombre, :categoria, :cantidad, :unidad, :created_at, :updated_at
json.url producto_url(producto, format: :json)
