json.array!(@espacos) do |espaco|
  json.extract! espaco, :id, :nome
  json.url espaco_url(espaco, format: :json)
end
