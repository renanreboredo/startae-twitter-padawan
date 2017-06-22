require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }
  it { should validate_uniqueness_of(:name) }

  context "when first start the application" do
    Team.fetch_team_members

    it 'fills up correctly the database' do
      expect(User.all.count).to eq(11)
    end

    it 'fetchs who have twitter' do
      expect(User.twitter_all.count).to eq(6)
    end
  end
end
