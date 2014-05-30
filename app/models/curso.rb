class Curso < ActiveRecord::Base
  has_many :disciplinas, dependent: :restrict_with_error

  validates :nome, presence: {message: '^Nome do curso não pode estar vazio.'}
end
