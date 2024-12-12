class MovieService
  # Method to fetch movies from the API
  def self.fetch_movies
    url = URI("https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")
    response = fetch_from_api(url)
    response["results"]
  end

  # Method to fetch a random movie
  def self.fetch_random_movie
    movies = fetch_movies
    movies.sample
  end

# Method to search movies by query
def self.search_movies(query)
  # Use URI.encode_www_form_component to safely encode the query
  url = URI("https://api.themoviedb.org/3/search/movie?query=#{URI.encode_www_form_component(query)}&language=en-US&page=1")
  # Assuming fetch_from_api fetches the response and returns it as a hash
  response = fetch_from_api(url)
  # Return the 'results' from the response (list of movies)
  response["results"]
end


  private

  def self.fetch_from_api(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = "application/json"
    request["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDFjOGMyZDYyY2Q0ZDcyYTU2ODliZmVmZWViYjE2NiIsIm5iZiI6MTYyMzkzNjkxMS4yNCwic3ViIjoiNjBjYjRmOGZmMTJjZjQwMDI5MzRiNTg5Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.ieWwt-rhmXPUxghR4H0xA37kK8fhM6bkdbjSNIZ7cdE"
    response = http.request(request)
    JSON.parse(response.read_body)
  end
end
