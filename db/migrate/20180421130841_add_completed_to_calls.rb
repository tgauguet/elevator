class AddCompletedToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :completed, :boolean, default: false
    add_column :calls, :inside, :boolean, default: false 
  end
end
