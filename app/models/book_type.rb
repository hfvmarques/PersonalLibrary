class BookType < ApplicationRecord
  has_many :books

  paginates_per 10
end
