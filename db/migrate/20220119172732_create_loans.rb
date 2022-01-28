class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :book, foreign_key: true
      t.string :description, null: false
      t.datetime :loaned_at
      t.datetime :returned_at

      t.timestamps
    end
  end
end
