class UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :show, :update]
  
  
  def edit
    if @user == current_user
      render :edit
    else
      redirect_to user_path(params[:id])
    end
  end

  def show
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile, :avatar)
  end
  
  def ensure_user
    @user = User.find(params[:id])
  end
end
