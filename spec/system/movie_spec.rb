require 'rails_helper'

RSpec.describe Movie, type: :service do
    describe 'Fetch movies', :vcr do
      it 'returns a list of movies with title and overview' do
        movies = MovieService.fetch_movies
      end
    end
end