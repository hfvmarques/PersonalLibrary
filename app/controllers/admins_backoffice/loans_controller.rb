class AdminsBackoffice::LoansController < AdminsBackofficeController
  before_action :set_loan, only: [:edit, :update, :destroy]

  def index
    @loans = Loan.all.order(:loanDate).page(params[:page])
  end

  def new
    @loan = Loan.new
  end

  def create
    
    @loan = Loan.new(params_loan)
    if @loan.save
      redirect_to admins_backoffice_loans_path, notice: "Cadastrado com sucesso!"
    else
      render :new
    end
  end
    
  def edit
  end  

  def update
    if @loan.update(params_loan)
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

  private

  def params_loan
    params_loan = params.require(:loan).permit(
      :book_id,
      :description,
      :loanDate,
      :returnDate,
      :active
    )
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
  
end
