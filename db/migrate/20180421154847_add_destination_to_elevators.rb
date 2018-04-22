class AddDestinationToElevators < ActiveRecord::Migration[5.2]
  def change
    add_column :elevators, :destination, :integer
  end
end
