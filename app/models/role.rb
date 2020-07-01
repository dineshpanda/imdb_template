class Role < ApplicationRecord
  enum role_type: {"hero"=>0, " heroin"=>1, " supporting"=>2} 

  # Direct associations

  belongs_to :actor,
             :counter_cache => true

  belongs_to :lead_movie,
             :class_name => "Movie",
             :foreign_key => "movie_id"

  belongs_to :movie,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :actor_id, :presence => true

  validates :character_name, :presence => true

  validates :movie_id, :presence => true

  # Scopes

  scope :lead, -> { where(roles: { lead: [true] }) }

end
