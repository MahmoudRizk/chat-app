class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :application_id, presence: true
  validates :count_in_application, presence: true

  def self.get_redis_key(application_global_id, count_in_application)
    "application:#{application_global_id}:chats_count:#{count_in_application}:messages_count"
  end
end
