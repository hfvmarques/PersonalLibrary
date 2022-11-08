# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :book

  validates :book, presence: true
  validates :description, presence: true
end
