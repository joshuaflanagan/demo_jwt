class AlbumsController < ApiController
  def index
    @albums = Album.where(user_id: current_user.id).order(:artist).order(:title).to_a

    render json: JSON.pretty_generate(AlbumSerializer.many(@albums).as_json)
  end
end
