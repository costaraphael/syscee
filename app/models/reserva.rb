class Reserva < ActiveRecord::Base
  belongs_to :solicitante, class_name: 'Usuario'
  belongs_to :deferente, class_name: 'Usuario'
  belongs_to :espaco

  has_many :logs, as: :loggable
end
