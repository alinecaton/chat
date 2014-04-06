class ChatMessagesController < ApplicationController
  before_action :set_chat_messages, only: :index

  def index
    redirect_to new_session_chat_messages_path if session[:user_name].nil?

    @chat_message  = ChatMessage.new
  end

  def create
    @chat_message = ChatMessage.new(permited_params)

    if @chat_message.save
      redirect_to root_path
    else
      set_chat_messages
      flash.now[:alert] = @chat_message.errors.full_messages.to_sentence
      render :index
    end
  end

  def new_session
  end

  def create_session
    session[:user_name] = params[:user][:name]
    redirect_to root_path
  end

  def destroy_session
    session[:user_name] = nil
    redirect_to new_session_chat_messages_path
  end

  private

  def permited_params
    params.require(:chat_message).permit(:content, :user_name)
  end

  def set_chat_messages
    @chat_messages = ChatMessage.all
  end
end