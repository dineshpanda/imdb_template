require "rails_helper"

RSpec.describe DirectorResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "directors",
          attributes: attributes_for(:director),
        },
      }
    end

    let(:instance) do
      DirectorResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { Director.count }.by(1)
    end
  end

  describe "updating" do
    let!(:director) { create(:director) }

    let(:payload) do
      {
        data: {
          id: director.id.to_s,
          type: "directors",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DirectorResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update).to eq(true)
      end.to change { director.reload.updated_at }
      # .and change { director.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:director) { create(:director) }

    let(:instance) do
      DirectorResource.find(id: director.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Director.count }.by(-1)
    end
  end
end
