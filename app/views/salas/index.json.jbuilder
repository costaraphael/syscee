json.array!(@salas) do |sala|
  json.extract! sala, :id, :predio_id, :nome, :numero, :capacidade
  json.url sala_url(sala, format: :json)
end
