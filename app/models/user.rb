class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def recent_posts(limit = 3)
    posts.last(limit)
  end
end
