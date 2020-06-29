class DirectorResource < ApplicationResource
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

  has_many   :filmography,
             resource: MovieResource

  # Indirect associations

  has_many :casts, resource: ActorResource do
    assign_each do |director, actors|
      actors.select do |a|
        a.id.in?(director.casts.map(&:id))
      end
    end
  end


  filter :actor_id, :integer do
    eq do |scope, value|
      scope.eager_load(:casts).where(:roles => {:actor_id => value})
    end
  end
end
