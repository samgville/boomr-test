require 'rails_helper'
require 'webmock/rspec'
RSpec.describe Company  do
  context "not integrated with gusto" do
    it "integrates with gusto" do
      company = Company.new
      uri = URI('https://api.gusto-demo.com/oauth/authorize')

      stub_request(:get, "/api.gusto-demo.com/oauth/authorize/").
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: "code=52434", headers: {})
      debugger
      response = Net::HTTP.get(uri)
      puts response.code
      company.gusto_id = response.code
      expect(company.gusto_id).to be_truthy
    end
  end

  context "integration with an existing gusto account" do
    it "doesn't integrates with gusto" do
      existing_company = Company.create({gusto_id:"larry"})
      new_company = Company.new
      uri = URI('https://api.gusto-demo.com/v1/me')
      stub_request(:get, "/api.gusto-demo.com/v1/me").
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: "", headers: {})
      response = Net::HTTP.get(uri)

      expect(response).to be_an_instance_of(String)

      expect(new_company.gusto_id).to be_falsey
    end
  end
end
