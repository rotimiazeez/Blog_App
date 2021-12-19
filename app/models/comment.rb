class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter(value)
    post.update(comments_counter: value)
  end
end
