class AddDescricaoToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :descricao, :text
  end
end
