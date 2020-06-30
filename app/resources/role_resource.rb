class RoleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :actor_id, :integer
  attribute :character_name, :string
  attribute :description, :string
  attribute :role_type, :integer_enum, allow: Role.role_types.keys

  # Direct associations

  belongs_to :actor

  belongs_to :movie

  # Indirect associations

end
