class Disciplina < ActiveRecord::Base
  belongs_to :curso
  belongs_to :professor, class_name: 'Usuario'

  has_many :ensalamentos

  validates :nome, presence: {message: '^O campo nome não pode estar vazio.'}
end
