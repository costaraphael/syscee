class CreatePredios < ActiveRecord::Migration
  def change
    create_table :predios do |t|
      t.string :nome

      t.timestamps
    end
  end
end
