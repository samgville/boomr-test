class CallbacksController < ApplicationController

def gusto
  current_company.gusto_id = params[:code]
  redirect_to companies_path

end

end
