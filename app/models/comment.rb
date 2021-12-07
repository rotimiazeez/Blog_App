class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_counter
    post.update(comments_counter: posts.comments_counter + 1)
  end
end
