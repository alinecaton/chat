Chat::Application.routes.draw do
  root 'chat_messages#index'

  resources :chat_messages, only: [:index, :create] do
    collection do
      get  :new_session
      post :create_session
      get  :destroy_session
      get  :history
    end
  end
end