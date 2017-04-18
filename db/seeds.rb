# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a2 = Artwork.create(title: 'Self Portrait', artist_id: 2, image_url: 'www.cnn.com')
a3 = Artwork.create(title: 'Grapes and Apples', artist_id: 4, image_url: 'www.apple.com')

share2 = ArtworkShare.create(viewer_id: 2, artwork_id: a3.id)
share3 = ArtworkShare.create(viewer_id: 4, artwork_id: a2.id)
