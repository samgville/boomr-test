require 'spec_helper'
require 'rails_helper'

feature 'Gusto API is down' do
  it 'shows server not responding alert' do
    uri = URI('https://api.gusto-demo.com')

    stub_request(:get, /api.gusto-demo.com/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 404, body: "not found", headers: {})
    response = Net::HTTP.get(uri)

    expect(response.status).to eql(404)
  end
end

feature 'Gusto Returns a 500 Error ' do
  it 'shows server 500 error alert' do
    uri = URI('https://api.gusto-demo.com')

    stub_request(:get, /api.gusto-demo.com/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: [500, "Internal Server Error"])
    response = Net::HTTP.get(uri)

    expect(response.status).to eql(500)

  end

end

feature 'Customer deauthorizes Account' do
  it 'shows account is deauthorized' do
    uri = URI('https://api.gusto-demo.com')

    stub_request(:get, /api.gusto-demo.com/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 20, body: "stubbed response", headers: {})
    response = Net::HTTP.get(uri)

    expect(response.status).to eql(20)
  end
end