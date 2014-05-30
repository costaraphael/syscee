json.array!(@ensalamentos) do |ensalamento|
  json.extract! ensalamento, :id, :disciplina_id, :sala_id, :periodo_id, :alunos, :final
  json.url ensalamento_url(ensalamento, format: :json)
end
