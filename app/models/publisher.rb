# frozen_string_literal: true

class Publisher < ApplicationRecord
  has_many :books

  validates_presence_of :description

  # paginates_per 10
end
