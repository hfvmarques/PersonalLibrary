# frozen_string_literal: true

class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :update_but_no_password, only: [:update]
  before_action :set_admin, only: %i[edit update destroy]

  def index
    @admins = Admin.all.order(:email).page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: 'Cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: 'Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: 'Excluído com sucesso!'
    else
      render :index
    end
  end

  private

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def update_but_no_password
    return unless params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?

    params[:admin].extract!(:password, :password_confirmation)
  end
end
