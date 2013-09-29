Offerlist::Application.routes.draw do
  

  resources :offers do
  	member do
  		get "activate"
  	end

  	collection do 
  		get "search"
  	end
  end


  root :to => "offers#index"

end