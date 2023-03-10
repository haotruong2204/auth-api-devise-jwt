# frozen_string_literal: true

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
class CompanySerializer
  include JSONAPI::Serializer

  attributes :id, :name, :address, :established_year, :administrator_id
end
