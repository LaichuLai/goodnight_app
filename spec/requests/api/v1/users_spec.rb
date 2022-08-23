require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    before do
      FactoryBot.create_list(:user, 10)
      get '/api/v1/users'
    end

    it 'returns all users' do
      expect(json["users"].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let!(:user) { FactoryBot.create(:user) }
    before do
      get "/api/v1/users/#{user.id}"
    end

    it "returns user data" do
      expect(json["name"]).to eq(user.name)
    end
  end
end
