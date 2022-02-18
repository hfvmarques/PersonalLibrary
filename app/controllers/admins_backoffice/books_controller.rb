# frozen_string_literal: true

class AdminsBackoffice::BooksController < AdminsBackofficeController
  before_action :find_book, only: %i[edit update destroy]
  before_action :all_authors, :all_publishers, :all_book_types, :all_subjects, only: %i[new edit]

  def index
    @books = Book.includes(
      :book_type,
      :publisher,
      :authors,
      :subjects
    ).order(:title)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params_book)
    if @book.save
      redirect_to admins_backoffice_books_path, notice: 'Cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(params_book)
      redirect_to admins_backoffice_books_path, notice: 'Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to admins_backoffice_books_path, notice: 'Excluído com sucesso!'
    else
      render :index
    end
  end

  private

  def params_book
    params.require(:book).permit(
      :title,
      :publisher_id,
      :published_at,
      :edition,
      :book_type_id,
      :active_loan,
      subject_ids: [],
      author_ids: []
    )
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def all_authors
    @authors = Author.all
  end

  def all_publishers
    @publishers = Publisher.all
  end

  def all_book_types
    @book_types = BookType.all
  end

  def all_subjects
    @subjects = Subject.all
  end
end
