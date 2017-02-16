class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :ssn, unique: true
      t.string :email
      t.string :date_of_birth
      t.decimal :pay_rate
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
