class Disciplina < ActiveRecord::Base
  belongs_to :curso
  belongs_to :professor, class_name: 'Usuario'

  has_many :ensalamentos
end
