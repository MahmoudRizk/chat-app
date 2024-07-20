class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :application_id, presence: true
  validates :chat_number, presence: true

  def self.get_redis_key(application_global_id, chat_number)
    "application:#{application_global_id}:chat:#{chat_number}:messages_count"
  end
end
