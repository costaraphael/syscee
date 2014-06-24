class AddAtivoToEnsalamento < ActiveRecord::Migration
  def change
    add_column :ensalamentos, :ativo, :boolean
  end
end
