require "rails_helper"

RSpec.describe Director, type: :model do
  describe "Direct Associations" do
    it { should have_many(:films) }
  end

  describe "InDirect Associations" do
    it { should have_many(:casts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
