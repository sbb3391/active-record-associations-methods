class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.size
  end

  def artist_count
    arr = []
    self.songs.collect do |song|
      arr << song.artist_id if arr.none?(song.artist_id)
    end
    arr.size
  end

  def all_artist_names
    x = self.songs.each {|song|}
    x.collect {|song| song.artist.name}
  end
end
