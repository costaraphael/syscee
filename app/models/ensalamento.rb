class Ensalamento < ActiveRecord::Base
  belongs_to :disciplina
  belongs_to :sala
  belongs_to :periodo
  belongs_to :deferente, class_name: 'Usuario', inverse_of: :deferimentos
  belongs_to :solicitante, class_name: 'Usuario', inverse_of: :solicitacoes

  has_many :logs, as: :loggable
  has_many :sugestoes

  validates :disciplina_id, presence: {message: '^O campo disciplina não pode estar vazio.'}
  validates :alunos, presence: {message: '^A quantidade de alunos não pode estar vazia.'}
  validates :periodo_id, presence: {message: '^O campo período não pode estar vazio.'}
end
