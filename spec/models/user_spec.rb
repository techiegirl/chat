require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }


  context 'Verify Presence Of Email' do
    it "should be valid with email and invalid without email" do
      FactoryGirl.build(:user, email: nil).should_not be_valid
      FactoryGirl.build(:user, :email => Faker::Internet.email).should be_valid
    end
  end

  context 'Verify Email Uniqness' do
    it "should not allow same email address for more than one record" do
      FactoryGirl.build(:user, email: user.email).should_not be_valid
    end
  end
end