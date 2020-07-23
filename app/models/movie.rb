class Movie < ApplicationRecord
  # Direct associations

  belongs_to :dictator,
             class_name: "Director",
             foreign_key: "director_id",
             counter_cache: :films_count

  has_many   :lead_roles,
             -> { lead },
             class_name: "Role",
             dependent: :destroy

  has_many   :roles,
             dependent: :destroy

  # Indirect associations

  has_many   :cast,
             through: :roles,
             source: :actor

  # Validations

  validates :director_id, presence: true

  validates :title, presence: true

  # Scopes
end
