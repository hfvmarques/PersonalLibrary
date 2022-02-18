# frozen_string_literal: true

class AdminsBackoffice::PublishersController < AdminsBackofficeController
  before_action :set_publisher, only: %i[edit update destroy]

  def index
    @publishers = Publisher.all.order(:description)
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(params_publisher)
    if @publisher.save
      redirect_to admins_backoffice_publishers_path, notice: 'Cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @publisher.update(params_publisher)
      redirect_to admins_backoffice_publishers_path, notice: 'Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      redirect_to admins_backoffice_publishers_path, notice: 'Excluído com sucesso!'
    else
      render :index
    end
  end

  private

  def params_publisher
    params.require(:publisher).permit(:description)
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end
end
