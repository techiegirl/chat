require 'rails_helper'

RSpec.describe Message, type: :model do

  context 'Verify Presence Of Body' do
    it "should be valid with message and invalid without message" do
      FactoryGirl.build(:message, message: nil).should_not be_valid
      FactoryGirl.build(:message, :message => "Hello friend!!").should be_valid
    end
  end

  context 'Verify Presence Of Sender ID' do
    it "should be valid with sender id and invalid without that" do
      FactoryGirl.build(:message, sender_id: nil).should_not be_valid
      FactoryGirl.build(:message, :sender_id => 1).should be_valid
    end
  end

  context 'Verify Presence Of Receiver ID' do
    it "should be valid with receiver ID and invalid without that" do
      FactoryGirl.build(:message, receiver_id: nil).should_not be_valid
      FactoryGirl.build(:message, :receiver_id => 2).should be_valid
    end
  end

end
