class UsersController < ApplicationController

  def new
    @user = env['omniauth.identity'] ||= User.new
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user and @user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
