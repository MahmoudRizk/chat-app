require 'elasticsearch/model'

class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'english'
      indexes :chat_id, analyzer: 'standard'
    end
  end

  belongs_to :chat

  validates :name, presence: true
  validates :chat_id, presence: true
  validates :message_number, presence: true
end
