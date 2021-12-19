FactoryBot.define do
  factory :comment do
    user
    post
    text { 'Sample test comment' }
  end
end
