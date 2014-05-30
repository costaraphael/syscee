class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.references :predio, index: true
      t.string :nome
      t.integer :numero
      t.integer :capacidade

      t.timestamps
    end
  end
end
