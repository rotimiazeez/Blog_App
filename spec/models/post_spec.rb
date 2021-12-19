require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { FactoryBot.build :post }

  describe 'validations' do
    describe 'title' do
      context 'when valid' do
        it { expect(subject).to be_valid }
      end

      context 'when not valid' do
        subject { described_class.new }
        it 'should be present' do
          expect(subject).to_not be_valid
        end

        it 'should have title with at most 250 characters' do
          subject.title = 'My post' * 250
          expect(subject).to_not be_valid
        end
      end
    end

    describe 'comments_counter' do
      subject { FactoryBot.create :post_with_comments, comments_counter: 5 }

      it 'should allow valid values' do
        subject.comments_counter = 0.23
        expect(subject).to_not be_valid
      end

      it 'should return 5 comments' do
        expect(subject.recent_comments.length).to be(5)
      end
    end
  end
end
