Offerlist::Application.routes.draw do
  resources :offers

  get "welcome/index"

end