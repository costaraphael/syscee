class TipoUsuario < ActiveRecord::Base
  has_many :usuarios, dependent: :restrict_with_error
end
