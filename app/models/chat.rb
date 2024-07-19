class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :application_id, presence: true
  validates :count_in_application, presence: true
end
