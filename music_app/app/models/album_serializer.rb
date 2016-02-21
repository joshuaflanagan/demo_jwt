class AlbumSerializer
  def initialize(album)
    @album = album
  end

  def as_json(*)
    {
      id: @album.id,
      title: @album.title,
      artist: @album.artist
    }
  end

  def self.many(albums)
    albums.map{|album| new(album)}
  end
end
