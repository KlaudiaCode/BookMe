class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update, :destroy, :change_password]
  before_action :find_user, only: [:show, :edit, :update, :change_password]

  def show
    @can_edit = logged_in? && current_user.username == @user.username
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Witaj #{@user.username}! Twoje konto zostało poprawie utworzone."
      redirect_to items_path
    else 
      flash[:warning] = @user.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Twoje dane zostały zaktualizowane.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def change_password
    if @user.authenticate(params[:old_password])
      @user.update(password: params[:password])
      flash[:success] = 'Hasło zostało zmienione'
    else
      flash[:warning] = 'Hasło nieprawidłowe'
    end
    redirect_to edit_user_path @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :username, :email, :password, :bio, :place, :latitude, :longitude)
  end

end