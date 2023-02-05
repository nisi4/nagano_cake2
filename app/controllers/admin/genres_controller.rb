class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    genre = Genre.new(params[:id])
    genre.save
    redirect_to genres_pa
  end

  def edit
  end
end
