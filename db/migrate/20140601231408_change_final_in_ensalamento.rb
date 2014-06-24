class ChangeFinalInEnsalamento < ActiveRecord::Migration
  def change
    change_column :ensalamentos, :final, :boolean, default: false
  end
end
