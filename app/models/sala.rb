class Sala < ActiveRecord::Base
  belongs_to :predio

  has_many :ensalamentos
  has_many :sugestaos

  validates :nome, presence: {message: '^Nome da sala não pode estar vazio.'}
  validates :numero, presence: {message: '^Número da sala não pode estar vazio.'}
  validates :predio_id, presence: {message: '^É preciso que se selecione um prédio para a sala.'}
  validates :capacidade, presence: {message: '^Capacidade da sala não pode estar vazia.'}
end
