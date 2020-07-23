class ActorResource < ApplicationResource
  secondary_endpoint "/current_actor", [:show]
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob, :string
  attribute :bio, :string
  attribute :email, :string
  attribute :password, :string
  attribute :image, :string
  attribute :address, :string

  # Direct associations

  has_many :roles

  # Indirect associations

  many_to_many :filmography,
               resource: MovieResource
end
