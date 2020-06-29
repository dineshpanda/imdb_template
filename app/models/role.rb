class Role < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :actor_id, :presence => true

  validates :character_name, :presence => true

  validates :movie_id, :presence => true

  # Scopes

end
