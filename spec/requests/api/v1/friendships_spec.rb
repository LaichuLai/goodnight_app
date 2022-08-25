require 'rails_helper'

RSpec.describe "Api::V1::Friendships", type: :request do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  describe "POST /create" do
    context "with valid parameters" do
      before do
        post "/api/v1/friendships", params: { user_id: user1.id, friend_id: user2.id }
      end

      it "create new user sleep record" do
        expect(Friendship.last.follower_id).to eq(user1.id)
      end

      it "return good night message" do
        expect(json['message']).to eq("Your just followed a friend!")
      end
    end

    context "with INVALID parameters" do
      before do
        post "/api/v1/friendships", params: { user_id: 33456789 }
      end

      it "return error message" do
        expect(json['message']).to eq("Data Not Found")
      end
    end
  end

  describe "DELETE /destroy" do
    before do
      FactoryBot.create(:friendship, follower: user1, friend: user2)
      delete "/api/v1/friendships", params: { user_id: user1.id, friend_id: user2.id }
    end

    it "desrtoy friendship" do
      expect(Friendship.last).to be_nil
    end
  end
end
