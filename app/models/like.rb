class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(value)
    post.update(likes_counter: value)
  end
end
