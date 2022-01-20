class AdminsBackoffice::BooksController < AdminsBackofficeController
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order(:title).page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
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
      :publisher, 
      :published_at, 
      :edition, 
      :book_type, 
      :activeLoan,
      :subject,
      :author
    )
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
