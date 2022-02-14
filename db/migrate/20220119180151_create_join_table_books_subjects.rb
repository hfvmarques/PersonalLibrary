# frozen_string_literal: true

# Creates join table of books and subjects
#
class CreateJoinTableBooksSubjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :subjects, id: false do |t|
      t.references :book, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end
