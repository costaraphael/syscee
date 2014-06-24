class AddCoodenadorToCurso < ActiveRecord::Migration
  def change
    add_belongs_to :cursos, :coordenador
  end
end
