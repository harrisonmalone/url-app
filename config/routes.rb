Rails.application.routes.draw do
  root to: 'links#index'
  get 'links/:id', to: 'links#show', as: 'link_show'
  post 'link', to: 'links#create'
  get '/:hash', to: 'links#go_to_link', as: 'go_to_link'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
