Mulet::Application.routes.draw do
  resources :lac_fish_by_dates, :only => [:index]
  post 'search' => 'lac_fish_by_dates#search', :as => :lac_fish_by_date_search
  get '/errors_page' => 'public#errors', :as => :errors_page
  resources :lac_temperatures, :except => [:destroy, :edit, :update, :show]

  resources :lacs

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root :to => 'public#index'
end
