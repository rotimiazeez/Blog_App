require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    subject { FactoryBot.build :comment }

    it 'updates the post counter' do
      subject.update_comments_counter(4)
      expect(subject.post.comments_counter).to be(4)
    end
  end
end
