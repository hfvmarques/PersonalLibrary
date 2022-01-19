class CreateJoinTableBooksAuthors < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :authors, id:false do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true
    end
  end
end
