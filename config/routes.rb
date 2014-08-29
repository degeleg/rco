Rails.application.routes.draw do
  

  devise_for :admins, path: 'admin', path_names: {sign_in: "login", sign_out: "logout"}, controllers: { sessions: 'admin/sessions' }
  

  concern :subscribers do
    resources :newsletters, only: :index
  end

  namespace :admin do
    resources :pages, :admins, :employees, :tasks, :supports
    concerns :subscribers
    root to: 'pages#index'
  end
  
  get 'contact', to: 'pages#contact'

  resources 'newsletters', only: [:create]
  resources 'contacts', only: [:create]

  root to: 'pages#index'
  get ':permalink', to: 'pages#show', as: :permalink
  

  post '/admin/tinymce_assets' => 'admin/tinymce_assets#create'

end
