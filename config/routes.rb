Offerlist::Application.routes.draw do
  resources :offers



  root :to => 'pages#index', :as => 'index'
  get "welcome/index"


end
