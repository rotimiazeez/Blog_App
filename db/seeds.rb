# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Juan', 'Pekka', 'Luula', 'Aarnio', 'Aarto']
5.times do |i|
	user = User.create(name: names[i], photo: "https://randomuser.me/api/portraits/men/jpg", bio: 'Lots of things to say in here')
	3.times do |j|
		post = Post.create(user_id: user.id, title: 'The post1', text: 'This post tells lot of stuff in the form of, of course, a post.')
		5.times do |k|
			Comment.create(user_id: user.id, post_id: post.id, text: 'This comment belongs to the post above.')
		end
	end
end