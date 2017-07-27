# :nodoc:
class UsersController < ApplicationController
  def index
    @page = params[:page].to_i
    @page = 1 if @page.zero?
    @allpage = User.all.count / 10
    @users = User.all.limit(10).offset((@page - 1) * 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :birthday, :gender, :password, :user_name, :avatar, :uid, :provider, :role)
    end
end
