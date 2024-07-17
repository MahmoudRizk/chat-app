class Chat < ApplicationRecord
  before_save :set_count_in_application
  after_save :update_application_chat_count

  belongs_to :application
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :application_id, presence: true

  private

  def set_count_in_application

    # If count_in_application is specified during database seeding then skip.
    unless self.count_in_application
      max_count_in_application = Chat.where(application_id: self.application_id).maximum(:count_in_application) || 0
      self.count_in_application = max_count_in_application + 1
    end
  end

  def update_application_chat_count
    application = Application.find(self.application_id)
    application.chats_count = Chat.where(application_id: application.id).count
    application.save
  end

end
