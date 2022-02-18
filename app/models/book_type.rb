# frozen_string_literal: true

class BookType < ApplicationRecord
  has_many :books

  validates_presence_of :description
end
