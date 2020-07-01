class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director,
             counter_cache: :filmography_count

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
