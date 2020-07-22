class RoleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :movie_id, :integer
  attribute :actor_id, :integer
  attribute :character_name, :string
  attribute :description, :string
  attribute :lead, :boolean

  # Direct associations

  belongs_to :actor

  belongs_to :lead_movie,
             resource: MovieResource,
             foreign_key: :movie_id

  belongs_to :movie

  # Indirect associations
end
