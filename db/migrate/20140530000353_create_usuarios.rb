class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cgu
      t.references :tipo_usuario, index: true

      t.timestamps
    end
  end
end
