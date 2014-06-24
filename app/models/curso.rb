class Curso < ActiveRecord::Base
  belongs_to :coordenador, class_name: 'Usuario'

  has_many :disciplinas, dependent: :restrict_with_error
  has_many :usuarios, dependent: :restrict_with_error

  validates :nome, presence: {message: '^Nome do curso não pode estar vazio.'}
end
