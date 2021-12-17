class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_comments_counter

  def update_comments_counter(value)
    post.update(comments_counter: value)
  end
end
