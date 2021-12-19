require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_path(@user.id)
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    post = @user.recent_posts[0]
    click_link("Post ##{post.id} - #{post.title}")
    expect(current_path).to eq user_post_path(@user.id, post.id)
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link('See all post')
    expect(current_path).to eq user_posts_path(@user.id)
  end
end
