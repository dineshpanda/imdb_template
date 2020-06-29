class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :integer
  attribute :duration, :integer
  attribute :description, :string
  attribute :image, :string
  attribute :director_id, :integer

  # Direct associations

  belongs_to :director

  has_many   :roles

  # Indirect associations

  many_to_many :cast,
               resource: ActorResource

end
