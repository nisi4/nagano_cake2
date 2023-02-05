class Admin::GenresController < ApplicationController
  def index
    if admin_signed_in?
      @genre = Genre.new
      @genres = Genre.all
    else
      redirect_to new_admin_session_path
    end
  end
  
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
