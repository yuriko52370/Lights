class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to mypage_user_path(user.id)
  end

  def mypage
    @user = current_user
    @posts = @user.posts
  end


private

def user_params
    params.require(:user).permit(:name)
end

def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to mypage_user_path(current_user.id)
    end
end

end
