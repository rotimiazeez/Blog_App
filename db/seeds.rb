names = ['Mateo', 'Hamsita', 'Nelsino', 'Carlosito', 'Leo']
5.times do |i|
	user = User.create(name: names[i], photo: "https://randomuser.me/api/portraits/men/jpg", bio: 'Lots of things to say in here')
	3.times do |j|
		post = Post.create(author_id: user.id, title: 'The post1', text: 'This post tells lot of stuff in the form of, of course, a post.')
		5.times do |k|
			Comment.create(author_id: user.id, post_id: post.id, text: 'This comment belongs to the post above.')
		end
	end
end
