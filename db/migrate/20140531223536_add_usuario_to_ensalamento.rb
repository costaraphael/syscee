class AddUsuarioToEnsalamento < ActiveRecord::Migration
  def change
    add_reference :ensalamentos, :solicitante, index: true
    add_reference :ensalamentos, :deferente, index: true
  end
end
