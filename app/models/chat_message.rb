class ChatMessage < ActiveRecord::Base
  validates :content, :user_name, presence: true
end
