require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  describe "GET #index", :vcr do
    context "when fetching popular movies" do
      it "returns a list of movies" do
        # Stub external API call here
        get :index
        
        # Assert that the API response is returned as expected
        expect(response).to have_http_status(:success)
        expect(assigns(:movies)).to be_an(Array)
        expect(assigns(:movies).first["title"]).to eq("Fake Movie 1")
      end
    end

    context "when searching for movies" do
      it "returns search results" do
        # Stub search API call here
        get :index, params: { search: "Inception" }
        
        expect(response).to have_http_status(:success)
        expect(assigns(:movies)).to be_an(Array)
        expect(assigns(:movies).first["title"]).to include("Inception")
      end
    end
  end
end
