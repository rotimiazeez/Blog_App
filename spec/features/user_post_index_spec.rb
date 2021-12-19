require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  background do
    @user = FactoryBot.create :user_with_posts
    sign_in @user
    visit user_posts_path(@user.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_selector('img')
  end

  scenario "I can see the user's username" do
    expect(page).to have_content @user.name
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content "Number of posts:#{@user.posts.size}"
  end

  scenario "I can see a post's title" do
    expect(page).to have_content @user.posts[0].title
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content @user.posts[0].text
  end

  scenario 'I can see the first comments on a post' do
    expect(page).to have_content @user.posts[0].recent_comments[0]
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content "Comments: #{@user.posts[0].comments.size}"
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content "Likes: #{@user.posts[0].likes.size}"
  end
end
