class Periodo < ActiveRecord::Base
  has_many :ensalamentos

  validates :nome, presence: {message: '^Nome do período não pode estar vazio.'}
end
