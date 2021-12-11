class Post < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def increment_counter
    user.update(posts_counter: user.posts_counter + 1)
  end

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
