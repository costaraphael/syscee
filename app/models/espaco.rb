class Espaco < ActiveRecord::Base
  has_many :reservas

  def to_s
    self.nome
  end
end
