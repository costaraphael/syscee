json.array!(@disciplinas) do |disciplina|
  json.extract! disciplina, :id, :nome, :curso_id, :professor_id
  json.url disciplina_url(disciplina, format: :json)
end
