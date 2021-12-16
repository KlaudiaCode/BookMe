class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Twoje dane zostały zaktualizowane.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def shelf
    @user = User.find(params[:id])
  end

  def change_password
    user = User.find(params[:id])
    if user.authenticate(params[:old_password])
      user.update(password: params[:password])
      flash[:success] = 'Hasło zostało zmienione'
    else
      flash[:warning] = 'Hasło nieprawidłowe'
    end
    redirect_to edit_user_path user
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :username, :email, :password)
  end

end