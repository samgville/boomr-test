json.extract! employee, :id, :first_name, :middle_name, :last_name, :ssn, :email, :date_of_birth, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)