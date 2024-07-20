class RenameColumnCountInChatToMessageNumber < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :count_in_chat, :message_number
  end
end
