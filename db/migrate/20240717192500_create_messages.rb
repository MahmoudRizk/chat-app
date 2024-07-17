class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.bigint :chat_id, null: false
      t.integer :count_in_chat, null: false

      t.timestamps
    end

    add_foreign_key :messages, :chats, column: :chat_id
    add_index :messages, :chat_id
  end
end
