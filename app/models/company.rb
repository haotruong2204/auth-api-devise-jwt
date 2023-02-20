# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  address          :string(255)
#  established_year :string(255)
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  administrator_id :integer
#
class Company < ApplicationRecord
  belongs_to :administrator

  validates :name, presence: true, uniqueness: true
  validates :address, :established_year, presence: true
end
