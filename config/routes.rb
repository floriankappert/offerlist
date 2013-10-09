Offerlist::Application.routes.draw do
  
  resources :offers do
    resources :offer_items
    
  	member do
  		get "activate"
  	end

  	collection do 
  		get "search"
      get "index_remote"
  	end
  end

  root :to => "offers#index"

end