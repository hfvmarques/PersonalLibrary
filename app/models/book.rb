class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :subjects
  belongs_to :publisher
  belongs_to :bookType
end
