require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:sleep_records) }
    it { should have_many(:friends) }
    it { should have_many(:followers) }
  end
end
