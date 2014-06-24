class AddLoggableTypeToLog < ActiveRecord::Migration
  def change
    add_column :logs, :loggable_type, :string
  end
end
