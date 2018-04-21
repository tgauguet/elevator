class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :floor
      t.string :name

      t.timestamps
    end
  end
end
