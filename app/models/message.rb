class Message < ApplicationRecord
  belongs_to :chat

  validates :name, presence: true
  validates :chat_id, presence: true
  validates :count_in_chat, presence: true
end
