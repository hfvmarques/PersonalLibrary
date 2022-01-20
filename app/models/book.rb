class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :subjects

  has_many :loans

  belongs_to :publisher
  belongs_to :book_type
end
