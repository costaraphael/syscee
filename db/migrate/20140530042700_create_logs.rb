class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :usuario, index: true
      t.references :loggable, index: true
      t.string :descricao

      t.timestamps
    end
  end
end
