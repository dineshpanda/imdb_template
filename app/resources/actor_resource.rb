class ActorResource < ApplicationResource
  secondary_endpoint '/current_actor', [:show]
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

  many_to_many :filmography,
               resource: MovieResource

  has_many :directors do
    assign_each do |actor, directors|
      directors.select do |d|
        d.id.in?(actor.directors.map(&:id))
      end
    end
  end


  filter :director_id, :integer do
    eq do |scope, value|
      scope.eager_load(:directors).where(:movies => {:director_id => value})
    end
  end
end
