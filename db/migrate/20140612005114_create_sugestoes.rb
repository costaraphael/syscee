class CreateSugestoes < ActiveRecord::Migration
  def change
    create_table :sugestoes do |t|
      t.references :sala, index: true
      t.references :ensalamento, index: true

      t.timestamps
    end
  end
end
