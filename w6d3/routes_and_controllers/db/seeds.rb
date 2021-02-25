# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Jim')
User.create(username: 'Susan')
User.create(username: 'Peter')
User.create(username: 'Tim')
User.create(username: 'Jadin')

Artwork.create(title: 'Waterfall' , image_url: 'wf.com', artist_id: 1)
Artwork.create(title: 'Rocks', image_url: 'rocks.com', artist_id: 2 )
Artwork.create(title: 'Trees', image_url: 'Trees.com', artist_id: 3)
Artwork.create(title: 'Birds', image_url: 'birdies.com', artist_id: 4)

ArtworkShare.create(artwork_id: 1, viewer_id: 4)
ArtworkShare.create(artwork_id:2 , viewer_id: 3)
ArtworkShare.create(artwork_id: 4, viewer_id: 1)
ArtworkShare.create(artwork_id: 2, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 2)