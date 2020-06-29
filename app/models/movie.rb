class Movie < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :director_id, :presence => true

  validates :title, :presence => true

  # Scopes

end
