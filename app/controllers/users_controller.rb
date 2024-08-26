class UsersController < ApplicationController
  def edit
  end

  def mypage
    @user = current_user
    @posts = Post.all
  end


private

def user_params
    params.require(:user).permit(:name)
end

def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
end

end
