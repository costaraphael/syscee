class Ensalamento < ActiveRecord::Base
  belongs_to :disciplina
  belongs_to :sala
  belongs_to :periodo

  has_many :logs, as: :loggable
  has_many :sugestaos
end
