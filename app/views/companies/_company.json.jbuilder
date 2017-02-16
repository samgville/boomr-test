json.extract! company, :id, :name, :email, :gusto_id, :redirect_uri, :client_secret, :password, :created_at, :updated_at
json.url company_url(company, format: :json)