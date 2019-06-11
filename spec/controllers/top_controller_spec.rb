require 'rails_helper'

RSpec.describe TopController, type: :controller do

  describe "GET #concept" do
    it "returns http success" do
      get :concept
      expect(response).to have_http_status(:success)
    end
  end

end
