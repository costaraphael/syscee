class ChangeAtivoInEnsalamento < ActiveRecord::Migration
  def change
    change_column :ensalamentos, :ativo, :boolean, default: true
  end
end
