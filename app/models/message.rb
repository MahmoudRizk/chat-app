class Message < ApplicationRecord
  before_save :set_count_in_chat
  after_save :update_messages_count_for_chat

  belongs_to :chat

  validates :name, presence: true
  validates :chat_id, presence: true

  private

  def set_count_in_chat
    # If count_in_chat is specified during database seeding then skip.
    unless self.count_in_chat
      max_count_in_chat = Message.where(chat_id: self.chat_id).maximum(:count_in_chat) || 0
      self.count_in_chat = max_count_in_chat + 1
    end
  end

  def update_messages_count_for_chat
    chat = Chat.find(self.chat_id)
    chat.messages_count = Message.where(chat_id: self.chat_id).count
    chat.save
  end

end
