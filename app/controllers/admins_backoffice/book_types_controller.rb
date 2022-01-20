class AdminsBackoffice::BookTypesController < AdminsBackofficeController
  before_action :set_book_type, only: [:edit, :update, :destroy]

  def index
    @book_types = BookType.all.order(:description).page(params[:page])
  end

  def new
    @book_type = BookType.new
  end
  
  def create
    @book_type = BookType.new(params_book_type)
    if @book_type.save
      redirect_to admins_backoffice_book_types_path, notice: "Cadastrado com sucesso!"
    else
      render :new
    end
  end
    
  def edit
  end  

  def update
    if @book_type.update(params_book_type)
      redirect_to admins_backoffice_book_types_path, notice: "Atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @book_type.destroy
      redirect_to admins_backoffice_book_types_path, notice: "Excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_book_type
    params_book_type = params.require(:book_type).permit(:description)
  end

  def set_book_type
    @book_type = BookType.find(params[:id])
  end
end
