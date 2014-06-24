class Sala < ActiveRecord::Base
  belongs_to :predio

  has_many :ensalamentos
  has_many :sugestoes

  validates :nome, presence: {message: '^Nome da sala não pode estar vazio.'}
  validates :numero, presence: {message: '^Número da sala não pode estar vazio.'}
  validates :predio_id, presence: {message: '^É preciso que se selecione um prédio para a sala.'}
  validates :capacidade, presence: {message: '^Capacidade da sala não pode estar vazia.'}

  def self.ensalaveis(ensalamento)
    salas_usadas = Ensalamento.where('periodo_id = ? AND sala_id IS NOT NULL', ensalamento.periodo_id).pluck(:sala_id)
    where(
        'capacidade >= ? AND (id NOT IN (?) OR id = ?)',
        ensalamento.alunos,
        salas_usadas.any? ? salas_usadas : '',
        ensalamento.sala_id
    )
  end
end
