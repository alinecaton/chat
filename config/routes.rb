Chat::Application.routes.draw do
  root 'chat_messages#index'

  resources :chat_messages, only: :index do
    collection do
      get  :new_session
      post :create_session
      get  :destroy_session
    end
  end
end