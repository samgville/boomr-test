class StaticController < ApplicationController
  before_filter :authenticate_company!
  def home
  end
end
