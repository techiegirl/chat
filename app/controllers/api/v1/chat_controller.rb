class Api::V1::ChatController < Api::V1::BaseController

# curl -v -H "Content-Type:application/json" -X POST http://localhost:3000/api/v1/chat/post_message -d '{"sender_id":"2", "receiver_email":"abc@gmail.com", "message_body":"This is John"}'


  def post_message
    sender_id = params[:sender_id]
    message_body = params[:message_body]
    receiver_email = params[:receiver_email]
    sender = User.find_by_id(sender_id)
    receiver = User.find_by_email(receiver_email)
    if sender.blank? || receiver.blank?
      render(json: {status: 500, errors: "User is not valid!"})
    else
      save_messages(sender, receiver, message_body)
      @all_messages = sender.conversations
      render json: @all_messages.as_json(
          include: {sender: {only: [:name]},
                    receiver: {only: [:name]}},
          only: [:message],
      ),
             status: :ok
    end
  end

  private

  def save_messages(sender, receiver, messege_body)
    Message.create(sender_id: sender.id, message: messege_body, receiver_id: receiver.id)
  end

end
