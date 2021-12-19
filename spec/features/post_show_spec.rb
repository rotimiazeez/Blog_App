require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  login_user
  background do
    @post = FactoryBot.create :post_with_comments, comments_counter: 5, user: @user
    visit user_post_path(@user.id, @post.id)
  end

  scenario 'I can see the post title' do
    expect(page).to have_content @post.title
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content @user.name
  end

  scenario 'I can see how many comments it has' do
    expect(page).to have_content 'Comments: 5'
  end

  scenario 'I can see how many likes it has.' do
    expect(page).to have_content 'Likes: 0'
  end

  scenario 'I can see the post body.' do
    expect(page).to have_content @post.text
  end

  scenario 'I can see the username of each commentor.' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.user.name
    end
  end

  scenario 'I can see the comment each commentor left' do
    @post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end
