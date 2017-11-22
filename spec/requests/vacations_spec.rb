require 'rails_helper'

RSpec.describe "Vacations", type: :request do
  describe "GET /vacations" do
    it "works! (now write some real specs)" do
      get vacations_path
      expect(response).to have_http_status(200)
    end
  end
end
