Offerlist::Application.routes.draw do
  

  resources :offers do
  	member do
  		get "activate"
  		delete "delete"
  	end

  	collection do 
  		get "search"
      get "index_remote"
  	end
  end

  root :to => "offers#index"

end