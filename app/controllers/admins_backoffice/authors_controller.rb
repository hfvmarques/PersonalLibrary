# frozen_string_literal: true

class AdminsBackoffice::AuthorsController < AdminsBackofficeController
  before_action :set_author, only: %i[edit update destroy]

  def index
    @authors = Author.all.order(:description).page(params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params_author)
    if @author.save
      redirect_to admins_backoffice_authors_path, notice: 'Cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @author.update(params_author)
      redirect_to admins_backoffice_authors_path, notice: 'Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      redirect_to admins_backoffice_authors_path, notice: 'Excluído com sucesso!'
    else
      render :index
    end
  end

  private

  def params_author
    params.require(:author).permit(:description)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
