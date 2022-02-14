# frozen_string_literal: true

class Site::WelcomeController < SiteController
  def index
    @books = Book.all_books
  end
end
