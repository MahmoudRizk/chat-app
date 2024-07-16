class Application < ApplicationRecord
  has_many :chats, dependent: :destroy

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true

  def self.generate_uuid
    SecureRandom.uuid
  end
end
