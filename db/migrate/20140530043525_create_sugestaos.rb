class CreateSugestaos < ActiveRecord::Migration
  def change
    create_table :sugestaos do |t|
      t.references :ensalamento, index: true
      t.references :sala, index: true

      t.timestamps
    end
  end
end
