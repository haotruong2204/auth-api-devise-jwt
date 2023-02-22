class AddRoleToAdministrators < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :role, :integer, default: 1
  end
end
