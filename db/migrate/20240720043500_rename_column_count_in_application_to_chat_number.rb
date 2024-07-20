class RenameColumnCountInApplicationToChatNumber < ActiveRecord::Migration[7.1]
  def change
    rename_column :chats, :count_in_application, :chat_number
  end
end
