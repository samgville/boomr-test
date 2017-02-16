require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :ssn => 2,
        :email => "Email",
        :date_of_birth => "Date Of Birth",
        :company => nil
      ),
      Employee.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :ssn => 2,
        :email => "Email",
        :date_of_birth => "Date Of Birth",
        :company => nil
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Date Of Birth".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
