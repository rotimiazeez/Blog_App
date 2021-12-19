require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  login_user
  background do
    @new_user = FactoryBot.create :user, name: 'New user'
    visit root_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content @new_user.name
  end

  scenario 'I can see the profile picture of each user' do
    expect(page).to have_selector('img')
  end

  scenario 'I can see the number of posts each user has written' do
    expect(page).to have_content "Number of posts:#{@new_user.posts_counter}"
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    find_link(@new_user.name).click
    expect(current_path).to eq user_path(@new_user.id)
  end
end
