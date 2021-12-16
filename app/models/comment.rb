class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :increment_counter

  def increment_counter
    post.increment!(:comments_counter)
  end
end
