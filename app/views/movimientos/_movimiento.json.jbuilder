json.extract! movimiento, :id, :producto_id, :tipo, :cantidad, :observacion, :created_at, :updated_at
json.url movimiento_url(movimiento, format: :json)
