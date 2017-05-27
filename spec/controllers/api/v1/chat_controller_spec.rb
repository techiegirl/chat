require 'rails_helper'

#curl -v -H "Content-Type:application/json" -X POST http://localhost:3000/api/v1/chat/post_message -d '{"sender_id":"2", "receiver_email":"abc@gmail.com", "message_body":"This is John"}'

RSpec.describe Api::V1::ChatController, type: :controller do


  let!(:user1) { FactoryGirl.create(:user, email: Faker::Internet.email, name: "John") }
  let!(:user2) { FactoryGirl.create(:user, email: Faker::Internet.email, name: "Mary") }
  let!(:user3) { FactoryGirl.create(:user, email: Faker::Internet.email, name: "Dana") }

  describe "POST messages" do
    context 'post a messages to a user' do
      it 'returns the conversation list' do
        post :post_message, sender_id: user1.id, receiver_email: user2.email, message_body: "Hello World  1!!!"
        post :post_message, sender_id: user2.id, receiver_email: user2.email, message_body: "Hello World  2!!!"
        expect(JSON.parse(response.body).count).to eq(2)

        post :post_message, sender_id: user3.id, receiver_email: user1.email, message_body: "Hello World  3!!!"
        expect(JSON.parse(response.body).count).to eq(1)

        post :post_message, sender_id: user2.id, receiver_email: user2.email, message_body: "Hello World  2!!!"
        expect(JSON.parse(response.body).count).to eq(3)
      end
    end
  end



end