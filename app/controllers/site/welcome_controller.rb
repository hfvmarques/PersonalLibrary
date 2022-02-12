class Site::WelcomeController < SiteController
  def index
    @books = Book
      .includes(:book_type, :publisher, :authors, :subjects)
      .order(:title)
  end
end
