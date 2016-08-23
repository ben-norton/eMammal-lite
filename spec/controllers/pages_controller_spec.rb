require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #learn_more" do
    it "returns http success" do
      get :learn_more
      expect(response).to have_http_status(:success)
    end
  end

end
