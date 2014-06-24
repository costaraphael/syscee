class CreateEspacos < ActiveRecord::Migration
  def change
    create_table :espacos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
