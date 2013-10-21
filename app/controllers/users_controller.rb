class UsersController < ApplicationController

  skip_before_filter :require_email
  before_filter :find_user

  def new
    @user = env['omniauth.identity'] ||= User.new
  end

  def update
    if @user and @user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end

end
