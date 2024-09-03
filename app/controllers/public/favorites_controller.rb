class Public::FavoritesController < ApplicationController

  def create
    choice = Choice.find(params[:choice_id])
    favorite = current_user.favorites.new(choice_id: choice.id)
    favorite.save
    redirect_to post_path(choice.post.id)
  end

  def destroy
    choice = Choice.find(params[:choice_id])
    favorite = current_user.favorites.find_by(choice_id: choice.id)
    favorite.destroy
    redirect_to post_path(choice.post.id)
  end
end
