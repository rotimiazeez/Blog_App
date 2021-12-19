require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build :user }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    subject { FactoryBot.create :user_with_posts, posts_counter: 3 }

    it 'should return 3 posts' do
      expect(subject.recent_posts.length).to be(3)
    end
  end
end
