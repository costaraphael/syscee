json.array!(@cursos) do |curso|
  json.extract! curso, :id, :nome
  json.url curso_url(curso, format: :json)
end
