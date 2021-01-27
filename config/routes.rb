Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts, path: '', param: :case_id, except: [:new, :index]
end
