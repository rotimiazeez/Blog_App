class Post < ApplicationRecord
  belongs_to :user, class_name: :User, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter

  validates :title, presence: true,
                    length: { maximum: 250, too_long: 'must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter(value)
    user.update('posts_counter', value)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
