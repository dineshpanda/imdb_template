class ActorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob, :string
  attribute :bio, :string
  attribute :image, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :roles

  # Indirect associations

end
