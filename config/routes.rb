Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "input_files#index"

  resources :input_files do
  end

  resources :company_sales do
  end
end
