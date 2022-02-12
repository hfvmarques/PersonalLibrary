class Site::SearchController < SiteController
  def books
    @books = Book.search_subject(params[:term])
  end
end
