class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :subjects

  has_many :loans

  belongs_to :publisher
  belongs_to :book_type
  
  paginates_per 10

  scope :search_subject, -> (term) {
    joins(:subjects).where("lower(subjects.description) LIKE ?", "%#{term.downcase}%").order(:title)
  }

  scope :all_books, -> {
    includes(:book_type, :publisher, :authors, :subjects).order(:title)
  }
end
