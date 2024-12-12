require 'sinatra/base'

class FakeMovieServer < Sinatra::Base
  # You can define an in-memory collection of movies to simulate the API response
  MOVIES = [
    { "title" => "Fake Movie 1", "id" => 1 },
    { "title" => "Fake Movie 2", "id" => 2 },
    { "title" => "Venom: The Last Dance", "id" => 3 }
  ]

  get '/movies/popular' do
    content_type :json
    MOVIES.to_json
  end

  get '/movies/search' do
    query = params['query']
    # Simulate a search result based on the query
    result = MOVIES.select { |movie| movie["title"].include?(query) }
    content_type :json
    result.to_json
  end

  # Start the fake server
  run! if app_file == $0
end
