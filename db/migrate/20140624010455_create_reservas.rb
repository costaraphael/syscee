class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.references :solicitante, index: true
      t.references :deferente, index: true
      t.references :espaco, index: true
      t.datetime :inicio
      t.datetime :fim

      t.timestamps
    end
  end
end
