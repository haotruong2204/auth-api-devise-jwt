class AddJtiToAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :jti, :string, null: false
    add_index :administrators, :jti, unique: true
  end
end
