class Message < ApplicationRecord
  belongs_to :chat

  validates :name, presence: true
  validates :chat_id, presence: true
  validates :message_number, presence: true
end
