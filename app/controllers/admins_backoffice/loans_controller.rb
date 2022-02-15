# frozen_string_literal: true

class AdminsBackoffice::LoansController < AdminsBackofficeController
  before_action :find_loan, only: %i[edit update destroy]
  before_action :all_books, only: %i[new edit]

  def index
    @loans = Loan.includes(:book).order(:loaned_at).page(params[:page])
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(params_loan)
    find_book
    if @book.active_loan == false
      @loan.save!
      @book.active_loan = true
      @book.save!
      redirect_to admins_backoffice_loans_path, notice: 'Cadastrado com sucesso!'
    else
      render :new, notice: 'Este livro já está emprestado!'
    end
  end

  def edit; end

  # rubocop:disable Metrics/AbcSize
  def update
    if check_date?('returned_at(3i)', 'returned_at(2i)', 'returned_at(1i)')
      @loan.update(params_loan)
      find_book
      @book.active_loan = false
      @book.save!

      redirect_to admins_backoffice_loans_path, notice: 'Atualizado com sucesso!'

    elsif params_loan
      find_book

      @book.active_loan = true
      @book.save!

      @loan.update(params_loan)

      redirect_to admins_backoffice_loans_path, notice: 'Atualizado com sucesso!'
    else
      render :edit
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    if @loan.destroy
      redirect_to admins_backoffice_loans_path, notice: 'Excluído com sucesso!'
    else
      render :index
    end
  end

  def find_book
    @book = Book.find(params_loan[:book_id])
  end

  private

  def check_date?(day, month, year)
    return false if params_loan[day].blank?

    return false if params_loan[month].blank?

    return false if params_loan[year].blank?

    true
  end

  def params_loan
    params.require(:loan).permit(
      :book_id,
      :description,
      :loaned_at,
      :returned_at
    )
  end

  def find_loan
    @loan = Loan.find(params[:id])
  end

  def all_books
    @books = Book.all
  end
end
