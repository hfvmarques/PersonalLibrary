# frozen_string_literal: true

class Subject < ApplicationRecord
  has_and_belongs_to_many :books

  paginates_per 10
end
