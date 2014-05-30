class Sugestao < ActiveRecord::Base
  belongs_to :ensalamento
  belongs_to :sala

  has_many :logs, as: :loggable
end
