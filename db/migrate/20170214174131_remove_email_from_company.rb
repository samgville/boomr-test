class RemoveEmailFromCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :email, :string
  end
end
