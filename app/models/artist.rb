class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    self.songs.first.genre
  end

  def song_count
    self.songs.size
  end

  def genre_count
    arr = []
    self.songs.collect do |song|
      arr << song.genre_id if arr.none?(song.genre_id)
    end
    arr.size
  end
end
