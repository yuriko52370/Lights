class UsersController < ApplicationController
  def edit
  end

  def mypage
   @posts = Post.all
  end

end
