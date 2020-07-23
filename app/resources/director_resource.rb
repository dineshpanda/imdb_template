class DirectorResource < ApplicationResource
  secondary_endpoint "/current_director", [:show]
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob, :string
  attribute :bio, :string
  attribute :image, :string
  attribute :email, :string
  attribute :password, :string
  attribute :address, :string

  # Direct associations

  has_many :movies

  # Indirect associations
end
