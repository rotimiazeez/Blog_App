require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path('1') }
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'rendered template is correct' do
      expect(response).to render_template('index')
    end
    it 'placeholder text is correct' do
      expect(response.body).to include('Here is a list of posts for a given user.')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path('1', '1') }
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'rendered template is correct' do
      expect(response).to render_template('show')
    end
    it 'placeholder text is correct' do
      expect(response.body).to include('Here is the post for the user.')
    end
  end
end
