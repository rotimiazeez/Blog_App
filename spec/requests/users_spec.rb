require 'rails_helper'

RSpec.describe 'Users', type: :request do
  login_user
  describe 'GET #index' do
    before do
      get users_path
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before do
      get user_path(@user.id)
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
