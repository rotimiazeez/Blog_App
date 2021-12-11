require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { User.new name: 'John Smith' }

    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a integer posts counter greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    it 'should return recent posts' do
      user = User.create(name: 'User 1', bio: 'User bio')
      post = Post.create(title: 'Post 1', text: 'Sample post text', user: user)
      Comment.create(text: 'Comment 1', post: post, user: user)
      Comment.create(text: 'Comment 2', post: post, user: user)
      Comment.create(text: 'Comment 3', post: post, user: user)
      Comment.create(text: 'Comment 4', post: post, user: user)

      subject { user }
      expect(subject.recent_posts.length).to be <= 3
    end
  end
end
