class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.text :content
      t.string :user_name

      t.timestamps
    end
  end
end
