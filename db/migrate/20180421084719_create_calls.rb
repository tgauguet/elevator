class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.integer :elevator_id
      t.string :direction

      t.timestamps
    end
  end
end
