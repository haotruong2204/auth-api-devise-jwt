class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :established_year
      t.string :address
      t.integer :administrator_id

      t.timestamps
    end
  end
end
