require 'rails_helper'

RSpec.describe "Api::V1::SleepRecords", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let(:sleep_record) { FactoryBot.create(:sleep_record, user: user) }
  describe "POST /create" do
    context "with valid parameters" do
      before do
        post "/api/v1/sleep_records", params: { name: user.name }
      end

      it "create new user sleep record" do
        expect(SleepRecord.last.user_id).to eq(user.id)
      end

      it "return good night message" do
        expect(json['message']).to eq("Good Night #{user.name}")
      end
    end

    context "with INVALID parameters" do
      before do
        post "/api/v1/sleep_records", params: { name: "Jojo123" }
      end

      it "return error message" do
        expect(json['message']).to eq("Data Not Found")
      end
    end

    context "if user already start timing" do
      before do
        sleep_record
        post "/api/v1/sleep_records", params: { name: user.name }
      end

      it "return current timing message" do
        expect(json['message']).to eq("Currently timing")
      end
    end
  end

  describe "PATCH /upadate" do
    context "with valid parameters" do
      before do
        sleep_record
        patch "/api/v1/sleep_records", params: { name: user.name }
      end

      it "return good day message" do
        expect(json['message']).to eq("Good Day #{user.name}")
      end
    end

    context "with INVALID parameters" do
      before do
        sleep_record
        patch "/api/v1/sleep_records", params: { name: "Jotaro123" }
      end

      it "return error message" do
        expect(json['message']).to eq("Data Not Found")
      end
    end
  end
end
