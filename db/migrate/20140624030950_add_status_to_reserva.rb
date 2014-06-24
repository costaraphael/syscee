class AddStatusToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :status, :integer
  end
end
