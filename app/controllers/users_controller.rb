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

  private

  def user_params
    params.require(:user).permit(:name, :surname, :username, :email, :password_digest)
  end

end