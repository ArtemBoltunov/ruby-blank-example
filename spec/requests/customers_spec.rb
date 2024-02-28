require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/customers/home"
      expect(response).to have_http_status(:success)
    end
  end

end
