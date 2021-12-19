FactoryBot.define do
  factory :post do
    user
    title { 'Post' }
    text { 'Sample test post' }

    factory :post_with_comments do
      transient do
        comments_counter { 2 }
      end

      comments do
        Array.new(comments_counter) { association(:comment) }
      end
    end
  end
end
