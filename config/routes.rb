Rails.application.routes.draw do
  root to:'books#index' 
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  resources 'users'
  
  
  resources 'books' do
    collection do
    get :mine
  end
  end
  
end



