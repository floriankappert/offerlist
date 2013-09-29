Offerlist::Application.routes.draw do
  

  resources :offers do
  	member do
  		put "activate" 
  	end
  end


  root :to => "offers#index"

end