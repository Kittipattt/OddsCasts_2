require "net/http"
require "uri"
require "json"

class MoviesController < ApplicationController
  def index
    # Fetching random movie
    @random_movie = MovieService.fetch_random_movie
    # Handling search query
    if params[:search].present?
      @movies = MovieService.search_movies(params[:search])
    else
      @movies = MovieService.fetch_movies
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end