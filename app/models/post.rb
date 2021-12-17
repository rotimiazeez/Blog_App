class Post < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :increment_counter

  def increment_counter
    user.increment!(:posts_counter)
  end

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
