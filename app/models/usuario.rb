class Usuario < ActiveRecord::Base
  belongs_to :tipo_usuario
  has_many :disciplinas, dependent: :restrict_with_error
  has_many :logs, dependent: :restrict_with_error

  validates :nome, presence: {message: '^Nome do usuário não pode estar vazio.'}
  validates :cgu, presence: {message: '^Número do CGU não pode estar vazio.'}
end
