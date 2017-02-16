class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :gusto_id, unique: true
      t.string :gusto_company_id
      t.string :redirect_uri
      t.string :client_secret
      t.string :password

      t.timestamps
    end
  end
end
