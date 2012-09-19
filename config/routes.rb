Test::Application.routes.draw do
  match '/saveurl', :to => 'home#saveurl'
  root :to => 'home#index'
end
