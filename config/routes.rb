Rails.application.routes.draw do
  get 'welcome/index'
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/create'
  get 'profiles/update'
  get 'scrape/index'

  resources :web_groups

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
