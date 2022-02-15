# frozen_string_literal: true

class MovieService
  def self.popular
    response = HTTParty.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_api_key']}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")
    response['results']
  end

  def self.top_rated
    response = HTTParty.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=5000")
    response['results']
  end

  def self.title_search(query)
    response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_api_key']}&language=en-US&query=#{query}&page=1&include_adult=false")
    response['results']
  end

  def self.recommendations(api_id)
    response = HTTParty.get("https://api.themoviedb.org/3/movie/#{api_id}/recommendations?api_key=#{ENV['TMDB_api_key']}&language=en-US&page=1")
    response['results']
  end

  def self.find_by_api_id(api_id)
    response = HTTParty.get("https://api.themoviedb.org/3/movie/#{api_id}?api_key=#{ENV['TMDB_api_key']}&language=en-US")
  end
end
