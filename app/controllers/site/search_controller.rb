# frozen_string_literal: true

class Site::SearchController < SiteController
  def books
    @books = Book.search_subject(params[:term])
  end

  def subject
    @books = Book.search_subject_id(params[:subject_id])
  end

  def author
    @books = Book.search_author_id(params[:author_id])
  end

  def publisher
    @books = Book.search_publisher_id(params[:publisher_id])
  end

  def book_type
    @books = Book.search_book_type_id(params[:book_type_id])
  end
end
