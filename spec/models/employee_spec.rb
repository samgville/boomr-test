require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "an employee exists with the same ssn" do
    it "doesn't create the employee" do
      existing_employee = Employee.create({ssn:"1"})
      new_employee = Employee.create
      new_employee.ssn = "1"
      saved = new_employee.save
      expect(saved).to be false
    end


  end
  context "pay rate updated in Gusto" do
    it "updates the payrate in Boomr"do
      existing_employee = Employee.create({pay_rate:200.00,ssn:"1"})
      old_pay_rate = existing_employee.pay_rate
      response = [
          {
              "id"=> 1123581321345589,
              "version"=> "db0edd04aaac4506f7edab03ac855d56",
              "first_name"=> "Soren",
              "middle_initial"=> "A",
              "last_name"=> "Kierkegaard",
              "email"=> "knight0faith@initech.biz",
              "ssn"=> "1",
              "date_of_birth"=> "1813-05-05",
              "jobs"=> [
                  {
                      "id"=> 1,
                      "title"=> "Underwater Basket Weaver",
                      "rate"=> "80000.00",
                      "payment_unit"=> "Year",
                      "location_id"=> 3141592653589793
                  }
              ],
              "home_address"=> {
                  "id"=> 1402342024000,
                  "version"=> "fe75bd065ff48b91c35fe8ff842f986c",
                  "employee_id"=> 1123581321345589,
                  "street_1"=> "425 2nd Street",
                  "street_2"=> "Suite 602",
                  "city"=> "San Francisco",
                  "state"=> "CA",
                  "zip"=> "94107",
                  "country"=> "USA"
              },
              "federal_tax_information"=>   {
                  "version"=> "6e177399876585d0dc493e439c00d18e",
                  "employee_id"=> 1123581321345589,
                  "withholding_allowance"=> 2,
                  "additional_withholding"=> "0.00",
                  "filing_status"=> "Single",
                  "decline_withholding"=> false
              },
              "garnishments"=> [
                  {
                      "id"=> 1363316538400333,
                      "version"=> "52b7c567242cb7452e89ba2bc02cb476",
                      "employee_id"=> 8964216891236743,
                      "active"=> true,
                      "amount"=> "8.00",
                      "description"=> "Company loan to employee",
                      "court_ordered"=> false,
                      "times"=> 5,
                      "recurring"=> false,
                      "annual_maximum"=> nil,
                      "pay_period_maximum"=> "100.00",
                      "deduct_as_percentage"=> true
                  }
              ],
              "eligible_paid_time_off"=> [],
              "terminated"=> false,
              "terminations"=> []
          }
      ]

      Employee.process_employee_table(response)
      existing_employee = Employee.find_by(ssn:"1")

      expect(existing_employee.pay_rate).should_not eql(old_pay_rate)

    end
  end

end
