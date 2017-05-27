class User < ActiveRecord::Base
   has_many :sent_messages,    class_name: "Message", foreign_key: "sender_id"
   has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

   validates_uniqueness_of :email
   validates :email, presence: true

   def conversations
      Message.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
   end
end
