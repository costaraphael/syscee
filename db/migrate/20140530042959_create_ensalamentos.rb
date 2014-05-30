class CreateEnsalamentos < ActiveRecord::Migration
  def change
    create_table :ensalamentos do |t|
      t.references :disciplina, index: true
      t.references :sala, index: true
      t.references :periodo, index: true
      t.integer :alunos
      t.boolean :final

      t.timestamps
    end
  end
end
