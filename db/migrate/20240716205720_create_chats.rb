class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :name, null: false
      t.bigint :application_id, null: false
      t.integer :count_in_application, null: false

      t.timestamps
    end

    add_foreign_key :chats, :applications, column: :application_id
    add_index :chats, :application_id
  end
end
