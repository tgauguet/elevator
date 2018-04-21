class AddInformationsToElevator < ActiveRecord::Migration[5.2]
  def change
    add_column :elevators, :position, :integer
    add_column :elevators, :moove_type, :string
  end
end
