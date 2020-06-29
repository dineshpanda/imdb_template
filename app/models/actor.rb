class Actor < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :dependent => :destroy

  # Indirect associations

  has_many   :filmography,
             :through => :roles,
             :source => :movie

  has_many   :directors,
             :through => :filmography,
             :source => :director

  # Validations

  validates :name, :presence => true

  # Scopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
