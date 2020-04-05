Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todos
  patch "todos/complete/:id", to: "todos#complete", as: "todo_complete"
  get "saipratap99/myusers", to: "todos#myusers"
  root to: "home#index"
end
