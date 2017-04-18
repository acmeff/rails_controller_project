class ArtworksController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    created_art = user.artworks
    shared_art = user.shared_artworks
    all_art = created_art + shared_art
    render json: all_art
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end


  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
