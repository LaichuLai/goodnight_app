require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) { FactoryBot.create(:user) }
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
    before do
      get "/api/v1/users/#{user.id}"
    end

    it "returns user data" do
      expect(json["name"]).to eq(user.name)
    end
  end

  describe "GET /friends" do
    let!(:friendship) { FactoryBot.create(:friendship) }
    before do
      get "/api/v1/users/#{friendship.follower_id}/friends"
    end

    it "returns friends data" do
      current_user = User.find(friendship.follower_id)
      user_friend = User.find(friendship.friend_id)
      expect(json["name"]).to eq(current_user.name)
      expect(json["friends"][0]["name"]).to eq(user_friend.name)
    end
  end

  describe "GET /friend" do
    let!(:user_friend) { FactoryBot.create(:user) }
    let!(:sleep_record) { FactoryBot.create(:sleep_record, :with_sleep_time, user: user_friend) }
    let!(:friendship) { FactoryBot.create(:friendship, follower: user, friend: user_friend) }
    before do
      get "/api/v1/users/#{friendship.follower_id}/friends/#{friendship.friend_id}"
    end

    it "returns friend data" do
      expect(json["name"]).to eq(user_friend.name)
      expect(json["sleep_records"][0]["sleep_time"]).to eq("08:00:00")
    end
  end
end
