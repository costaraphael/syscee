json.array!(@predios) do |predio|
  json.extract! predio, :id, :nome
  json.url predio_url(predio, format: :json)
end
