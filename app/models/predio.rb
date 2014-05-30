class Predio < ActiveRecord::Base
  has_many :salas, dependent: :restrict_with_error

  validates :nome, presence: {message: '^Nome do prédio não pode estar vazio.'}
end
