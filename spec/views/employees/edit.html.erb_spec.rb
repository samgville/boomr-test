require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :ssn => 1,
      :email => "MyString",
      :date_of_birth => "MyString",
      :company => nil
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input#employee_first_name[name=?]", "employee[first_name]"

      assert_select "input#employee_middle_name[name=?]", "employee[middle_name]"

      assert_select "input#employee_last_name[name=?]", "employee[last_name]"

      assert_select "input#employee_ssn[name=?]", "employee[ssn]"

      assert_select "input#employee_email[name=?]", "employee[email]"

      assert_select "input#employee_date_of_birth[name=?]", "employee[date_of_birth]"

      assert_select "input#employee_company_id[name=?]", "employee[company_id]"
    end
  end
end
