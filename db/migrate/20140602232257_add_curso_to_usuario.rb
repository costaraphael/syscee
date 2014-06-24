class AddCursoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :curso_id, :integer
  end
end
