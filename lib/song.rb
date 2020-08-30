class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song= self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song= self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    self.all.sort_by { |song| song.name} #sort_by sorts what it is told in the brackets
  end

  def self.new_from_filename(new_file)
    parts_of_new_file = new_file.split(" - ") # splits it at "-" making it into 2 seperate sections
    artist_name = parts_of_new_file[0]
    song_name = parts_of_new_file[1].gsub(".mp3", "") # . gsub replaces ".mp3" with ""
    # binding.pry

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(file_name)
    parts_of_new_file = file_name.split(" - ")
    artist_name = parts_of_new_file[0]
    song_name = parts_of_new_file[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.destroy_all
    self.all.clear     #.clear deletes all data in the class
  end


end
