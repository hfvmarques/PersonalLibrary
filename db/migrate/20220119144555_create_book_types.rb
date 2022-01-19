class CreateBookTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :book_types do |t|
      t.string :description, null:false

      t.timestamps
    end
  end
end
