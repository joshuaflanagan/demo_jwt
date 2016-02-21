class AlbumsController < ApiController
  def index
    @albums = Album.order(:artist).order(:title)

    render json: JSON.pretty_generate(AlbumSerializer.many(@albums).as_json)
  end
end
