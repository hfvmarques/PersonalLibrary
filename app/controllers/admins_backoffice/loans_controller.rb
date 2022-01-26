class AdminsBackoffice::LoansController < AdminsBackofficeController
  before_action :set_loan, only: [:edit, :update, :destroy]
  before_action :get_books, only: [:new, :edit]

  def index
    @loans = Loan.includes(:book).order(:loanDate).page(params[:page])
  end

  def new
    @loan = Loan.new
  end

  def create

    @loan = Loan.new(params_loan)
    set_book
    if @book.activeLoan == false
      @loan.save!
      @book.activeLoan = true
      @book.save!
      redirect_to admins_backoffice_loans_path, notice: "Cadastrado com sucesso!"
    else
      render :new, notice: "Este livro já está emprestado!"
    end
  end
    
  def edit
  end  

  def update
    
    if !params_loan['returnDate(3i)'].blank? && !params_loan['returnDate(2i)'].blank? && !params_loan['returnDate(1i)'].blank?
      @loan.update(params_loan)
      set_book
      @book.activeLoan = false
      @book.save!

      redirect_to admins_backoffice_loans_path, notice: "Atualizado com sucesso!"

    elsif params_loan
      set_book

      @book.activeLoan = true
      @book.save!

      @loan.update(params_loan)

      redirect_to admins_backoffice_loans_path, notice: "Atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @loan.destroy
      redirect_to admins_backoffice_loans_path, notice: "Excluído com sucesso!"
    else
      render :index
    end
  end

  def set_book
    @book = Book.find(params_loan[:book_id])
  end

  private

  def params_loan
    params_loan = params.require(:loan).permit(
      :book_id,
      :description,
      :loanDate,
      :returnDate
    )
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def get_books
    @books = Book.all
  end
  
end
