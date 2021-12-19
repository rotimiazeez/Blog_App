require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_content 'Pagination'
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    post = @user.posts[0]
    click_link("Post ##{post.id} - #{post.title}")
    expect(current_path).to eq user_post_path(@user.id, post.id)
  end
end
