class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id
  after_save :update_likes_counter

  def update_likes_counter(value)
    post.update('likes_counter', value)
  end
end
