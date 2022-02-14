# frozen_string_literal: true

class Publisher < ApplicationRecord
  has_many :books

  paginates_per 10
end
