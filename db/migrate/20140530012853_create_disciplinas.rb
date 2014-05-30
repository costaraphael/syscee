class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.string :nome
      t.references :curso, index: true
      t.references :professor, index: true

      t.timestamps
    end
  end
end
