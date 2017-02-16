require 'net/https'
require 'uri'
require 'json'
class Company < ApplicationRecord
  has_many :employees
  include HTTParty
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def employees
    Employee.where("company_id = ? " , self.id)
  end

  def authenticate

    uri = URI('https://api.gusto-demo.com')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
  # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new('/oauth/token')
    params = {
        client_id: current_company.client_id,
        client_secret: current_company.client_secret,
        redirect_uri: current_company.redirect_uri,
        code: '',
        grant_type: 'authorization_code'
    }

    request.set_form_data params
    response = http.request(request)
    JSON.parse(response.body)
    @options = { query: { site: service, page: page } }
  end


end



