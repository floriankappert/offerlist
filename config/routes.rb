Offerlist::Application.routes.draw do
  

  resources :offers do
  	member do
  		get "activate"
  		delete "delete"
  	end

  	collection do 
  		get "search"
  	end
  end

  root :to => "offers#index"

end