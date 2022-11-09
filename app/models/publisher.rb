# frozen_string_literal: true

class Publisher < ApplicationRecord
  has_many :books

  validates :description, presence: true
end
