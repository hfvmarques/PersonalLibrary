class AdminsBackoffice::BooksController < AdminsBackofficeController
  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :set_author_options, :set_subject_options, only: %i[ new create edit update]

  def index
    @books = Book.all.order(:title).page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    
    binding.pry
    
    @book = Book.new(params_book)
    if @book.save
      redirect_to admins_backoffice_books_path, notice: "Cadastrado com sucesso!"
    else
      render :new
    end
  end
    
  def edit
  end  

  def update
    if @book.update(params_book)
      redirect_to admins_backoffice_books_path, notice: "Atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to admins_backoffice_books_path, notice: "Excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_book
    params_book = params.require(:book).permit(
      :title,
      :publisher_id,
      :published_at,
      :edition,
      :book_type_id,
      :activeLoan,
      subject_ids: [],
      author_ids: []
    )
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_author_options
    @author_options = Author.all.pluck(:description, :id)
  end

  def set_subject_options
    @subject_options = Subject.all.pluck(:description, :id)
  end
  
end
