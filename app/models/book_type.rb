# frozen_string_literal: true

class BookType < ApplicationRecord
  has_many :books

  validates :description, presence: true
end
