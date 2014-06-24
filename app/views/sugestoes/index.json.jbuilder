json.array!(@sugestaos) do |sugestao|
  json.extract! sugestao, :id
  json.url sugestao_url(sugestao, format: :json)
end
