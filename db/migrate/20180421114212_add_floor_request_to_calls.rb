class AddFloorRequestToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :floor_request, :integer
  end
end
