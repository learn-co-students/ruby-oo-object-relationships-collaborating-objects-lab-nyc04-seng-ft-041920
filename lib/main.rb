require "pry"
require_relative "artist.rb"
require_relative "song.rb"
require_relative "mp3_importer.rb"

# theWeeknd = Artist.new("TheWeeknd")
# starboy = Song.new("Starboy")
# starboy.artist = theWeeknd
# # p starboy.artist.name

# adele = Artist.new("Adele")
# hello = Song.new("Hello")
# hello.artist = adele
# # p hello.artist
# puts "======="
# p adele.songs
# puts "======="
# # [hello]
# Song.class

Song.new_by_filename('TheWeeknd - Starboy - pop.mp3')
Song.new_by_filename('TheWeeknd - Blinded By The Lights - pop.mp3')
Song.new_by_filename('TheWeeknd - Fall Out - pop.mp3')

mj = Artist.new('Michael Jackson')
dirty_diana = Song.new("Dirty Diana")
billie_jean = Song.new("Billie Jean")
piano_man = Song.new("Piano Man")
mj.add_song(dirty_diana)
mj.add_song(billie_jean)

# p mj.songs
# p mj.print_songs

test_music_path = "./spec/fixtures/mp3s"
music_importer = MP3Importer.new(test_music_path)

# music_importer.files
music_importer.import




# new_instance = Song.new_by_filename(file_name)
# p new_instance
# p new_instance.name
# p new_instance.artist
# 'Black or White'


# # theWeeknd = Artist.new("TheWeeknd")
# # jackJohnson = Artist.new("Jack Johnson")
# # # p theWeeknd.name

# # # "Too Late"
# # # "Blinded By The Lights"

# # heartless = Song.new("Heartless", "Alternative R&B")
# # snowchild = Song.new("Snowchild", "Alternative R&B")

# # heartless.artist = theWeeknd
# # p heartless.title
# # p heartless.genre
# # p heartless.artist_name

# # puts "======================"
# # puts "======================"

# # snowchild.artist = theWeeknd
# # p snowchild.title
# # p snowchild.genre
# # p snowchild.artist_name

# # puts "======================"
# # puts "======================"

# # jackJohnson.create_song_by_name("Better Together", "surf music")
# # jackJohnson.create_song_by_name("I got you", "surf music")
# # jackJohnson.create_song_by_name("Never Fade", "surf music")

# # p jackJohnson.artist_songs

# # puts "**********************"
# # puts "**********************"

# # p Song.all

# # # binding.pry