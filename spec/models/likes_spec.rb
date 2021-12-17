require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#increment_counter' do
    user = User.create(name: 'User 1', bio: 'User bio')
    post = Post.create(title: 'Post 1', text: 'Sample post text', user: user)
    subject { Like.create(post: post, user: user) }

    it 'should increment the post likes counter' do
      subject.increment_counter
      expect(subject.post.likes_counter).to be(1)
    end
  end
end
