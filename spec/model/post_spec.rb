require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    subject { Post.new title: 'Post 1', user_id: 0 }

    before { subject.save }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not have a blank title' do
      subject.title = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a title length of not more than 250 characters' do
      subject.title = 'Sample text' * 250
      expect(subject).to_not be_valid
    end

    it 'should have a comments counter greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have a likes counter greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_comments' do
    it 'should return recent comments' do
      user = User.create(name: 'User 1', bio: 'User bio')
      post = Post.create(title: 'Post 1', text: 'Sample post text', user: user)
      Comment.create(text: 'Comment 1', post: post, user: user)
      Comment.create(text: 'Comment 2', post: post, user: user)
      Comment.create(text: 'Comment 3', post: post, user: user)
      Comment.create(text: 'Comment 4', post: post, user: user)
      Comment.create(text: 'Comment 5', post: post, user: user)
      Comment.create(text: 'Comment 6', post: post, user: user)

      subject { post }
      expect(subject.recent_comments.length).to be <= 5
    end
  end
end
