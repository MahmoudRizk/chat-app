class Application < ApplicationRecord
  has_many :chats, dependent: :destroy

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true

  def self.generate_uuid
    SecureRandom.uuid
  end

  def self.get_redis_key(application_global_id)
    "application:#{application_global_id}:chats_count"
  end
end
