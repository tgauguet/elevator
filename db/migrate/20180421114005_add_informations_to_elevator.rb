class AddInformationsToElevator < ActiveRecord::Migration[5.2]
  def change
    add_column :elevators, :position, :integer
    add_column :elevators, :direction, :string, default: "up"
  end
end
