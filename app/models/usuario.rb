class Usuario < ActiveRecord::Base
  belongs_to :tipo_usuario
  belongs_to :curso

  has_many :disciplinas, dependent: :restrict_with_error
  has_many :logs, dependent: :restrict_with_error
  has_many :deferimentos, class_name: 'Ensalamento', inverse_of: :deferente, foreign_key: 'deferente_id'
  has_many :solicitacoes, class_name: 'Ensalamento', inverse_of: :solicitante, foreign_key: 'solicitante_id'
  has_many :cursos

  has_many :reservas_solicitadas, class_name: 'Reserva', inverse_of: :solicitante
  has_many :reservas_efetuadas, class_name: 'Reserva', inverse_of: :deferente

  validates :nome, presence: {message: '^Nome do usuário não pode estar vazio.'}
  validates :cgu, presence: {message: '^Número do CGU não pode estar vazio.'}
  validates :curso_id, presence: {message: '^O campo curso não pode estar vazio para um coordenador de curso.'}, if: :coordenador?

  def coordenador?
    tipo_usuario_id == 2
  end
end
