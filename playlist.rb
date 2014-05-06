# Your awesome code goes here!
class Song
  attr_reader :title, :band
  
  def initialize(title, band)
    @title = title
    @band = band
  end
  
  def play
    puts "You are listening to #{@title} by #{@band}."
  end  
end


class Playlist
    attr_reader :song_list
  
    def initialize(*songs)
      @song_list = songs
    end
    
    def add(*songs)
      @song_list.concat(songs)
    end
    
    def num_of_tracks
      @song_list.length
    end
    
    def remove(song)
      @song_list.delete(song)
    end
    
    def includes?(song)
      @song_list.include?(song)
    end
    
    def play_all
      puts "Songs playing: " 
      @song_list.each { |song| puts "#{song.title} by #{song.band}" }
    end
    
    def display
      puts "Songs on the playlist: " 
      @song_list.each { |song| puts "#{song.title} by #{song.band}" }
    end

    def clear
      @song_list = []
    end

    def shuffle
      @song_list.shuffle!
    end

end

 
#### Driver Code#### The code below should *drive* your coding...
 
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)

lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display
my_playlist.shuffle
my_playlist.display
my_playlist.clear
my_playlist.display
 
 
 
### Put your Reflection here:
# Worked with Mazza in this one and his pragmatism helped a lot.
# We just ran the code and created the methods as we went.
# We have some doubts about what some methods should do, and we kept it simple when that happened
# I need to learn about how to create relationshinps between different classes
