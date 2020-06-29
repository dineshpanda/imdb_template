json.extract! director, :id, :name, :dob, :bio, :image, :email, :password, :created_at, :updated_at
json.url director_url(director, format: :json)
