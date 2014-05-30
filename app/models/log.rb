class Log < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :loggable, polymorphic: true
end
