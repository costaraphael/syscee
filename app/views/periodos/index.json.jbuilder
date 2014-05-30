json.array!(@periodos) do |periodo|
  json.extract! periodo, :id, :nome
  json.url periodo_url(periodo, format: :json)
end
