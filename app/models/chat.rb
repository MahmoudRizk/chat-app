class Chat < ApplicationRecord
  before_save :set_count_in_application

  belongs_to :application

  validates :name, presence: true
  validates :application_id, presence: true

  private

  def set_count_in_application
    max_count_in_application = Chat.where(application_id: self.application_id).maximum(:count_in_application) || 0
    self.count_in_application = max_count_in_application + 1
  end

end
