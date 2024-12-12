require "rails_helper"

RSpec.describe MovieService do
  describe ".fetch_movies", :vcr do
    it "returns a list of popular movies" do
      # Call the service method to fetch movies
      movies = MovieService.fetch_movies

      # Verify the response from the fake server (cassette)
      expect(movies).to be_an(Array)
      # Update this expectation to match the actual movie titles returned by the VCR cassette
      expect(movies.first["title"]).to eq("Venom: The Last Dance")  # Replace with an actual title from the cassette
    end
  end

  describe ".search_movies", :vcr do
    it "returns search results for a query" do
      # Call the service method to search movies
      movies = MovieService.search_movies("Inception")

      # Verify the search results from the fake server (cassette)
      expect(movies).to be_an(Array)
      # Ensure the title in the result contains the search query "Inception"
      expect(movies.first["title"]).to include("Inception")
    end
  end
end
