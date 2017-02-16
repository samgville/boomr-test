Rails.application.routes.draw do
  get 'static/home'

  root to: "static#home"
  devise_for :companies
  resources :companies do
    resources :employees
  end

#  http://localhost:3000/dashboard/settings/integrations/gusto/oauth_callback
  scope "dashboard/settings/integrations/gusto" do

    get "oauth_callback", to: "callbacks#gusto"

  end


end
