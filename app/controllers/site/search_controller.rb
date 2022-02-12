class Site::SearchController < SiteController
  def books
    @books = Book.joins(:subjects).where("lower(subjects.description) LIKE ?", "%#{params[:term].downcase}%")      
  end
end
