class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher, foreign_key: true
      t.integer :published_at
      t.integer :edition
      t.references :book_type, foreign_key: true
      t.boolean :activeLoan

      t.timestamps
    end
  end
end
