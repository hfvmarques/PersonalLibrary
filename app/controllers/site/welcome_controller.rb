class Site::WelcomeController < SiteController
  def index
    @books = Book.all_books
  end
end
