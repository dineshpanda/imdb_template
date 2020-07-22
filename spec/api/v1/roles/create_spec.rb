require "rails_helper"

RSpec.describe "roles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/roles", payload
  end

  describe "basic create" do
    let(:params) do
      attributes_for(:role)
    end
    let(:payload) do
      {
        data: {
          type: "roles",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(RoleResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Role.count }.by(1)
    end
  end
end
