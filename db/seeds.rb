# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
carly_rae = Artist.create(name: "Carly Rae")
britney = Artist.create(name: "Britney Spears")
journey = Artist.create(name: "Journey")
song_1 = carly_rae.songs.create(title:       "I Really Like You",
                     length:      208,
                     play_count:  243810867)
song_2 = Song.create(title:       "Call Me Maybe",
                     length:      199,
                     play_count:  1214722172,
                    artist_id: carly_rae.id)
song_3 = Song.create(title:       "Crazy",
                     length:      199,
                     play_count:  1214722172,
                    artist_id: britney.id)
song_4 = Song.create(title:       "Toxic",
                     length:      199,
                     play_count:  1214722172,
                    artist_id: britney.id)
song_5 = Song.create(title:       "Don't Stop Believin",
                     length:      199,
                     play_count:  1214722172,
                    artist_id: journey.id)
song_6 = Song.create(title:       "Wheel in the sky",
                     length:      199,
                     play_count:  1214722172,
                    artist_id: journey.id)
