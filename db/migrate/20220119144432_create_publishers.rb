class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :description, null:false

      t.timestamps
    end
  end
end
