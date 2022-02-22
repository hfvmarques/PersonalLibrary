# frozen_string_literal: true

class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @subjects = Subject.all.count
    @authors = Author.all.count
    @publishers = Publisher.all.count
    @books = Book.all.count
    @loans = Loan.all.count
    @book_types = BookType.all.count
  end
end
