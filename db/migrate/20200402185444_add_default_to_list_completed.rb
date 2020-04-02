class AddDefaultToListCompleted < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:list_items, :completed, false)
  end
end
