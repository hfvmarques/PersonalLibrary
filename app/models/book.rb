# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :subjects

  has_many :loans

  belongs_to :publisher
  belongs_to :book_type

  # paginates_per 10

  scope :search_subject, lambda { |term|
    include_attributes.joins(:subjects).where(
      'lower(subjects.description) LIKE ?', "%#{term.downcase}%"
    ).order(:title)
  }

  scope :search_subject_id, lambda { |subject_id|
    include_attributes.joins(:subjects).where(
      subjects: { id: subject_id }
    ).order(:title)
  }

  scope :search_author_id, lambda { |author_id|
    include_attributes.joins(:authors).where(
      authors: { id: author_id }
    ).order(:title)
  }

  scope :search_publisher_id, lambda { |publisher_id|
    include_attributes.where(
      publisher_id: publisher_id
    ).order(:title)
  }

  scope :search_book_type_id, lambda { |book_type_id|
    include_attributes.where(
      book_type_id: book_type_id
    ).order(:title)
  }

  scope :all_books, lambda {
    include_attributes.order(:title)
  }
end

private

def include_attributes
  includes(:book_type, :publisher, :authors, :subjects)
end
