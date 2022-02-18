# frozen_string_literal: true

class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates_presence_of :description

  # paginates_per 10
end
