Rails.application.routes.draw do
  get 'repositories/search'
  root 'repositories#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
