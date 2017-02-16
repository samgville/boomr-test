class AddColumnToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :client_id, :string
  end
end
