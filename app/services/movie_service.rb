class MovieService
  #{"page":1,"results":[{"adult":false,"backdrop_path":"/wYMbnrdRCREjNLwFlG5SLWzBjui.jpg",
  #"genre_ids":[878,12],"id":438631,"original_language":"en","original_title":"Dune",
  #"overview":"Paul Atreides, a brilliant and gifted young man born into a great destiny 
  #beyond his understanding, must travel to the most dangerous planet in the universe to 
  #ensure the future of his family and his people. As malevolent forces explode into conflict 
  #over the planet's exclusive supply of the most precious resource in existence-a commodity 
  #capable of unlocking humanity's greatest potential-only those who can conquer their fear will 
  #survive.","popularity":824.127,"poster_path":"/d5NXSklXo0qyIYkgV94XAgMIckC.jpg","release_date":"2021-09-15",
  #"title":"Dune","video":false,"vote_average":7.9,"vote_count":5664}
  
  #configuration = {"images":{"base_url":"http://image.tmdb.org/t/p/","secure_base_url":"https://image.tmdb.org/t/p/",
  #"backdrop_sizes":["w300","w780","w1280","original"],"logo_sizes":["w45","w92","w154","w185","w300","w500","original"],
  #"poster_sizes":["w92","w154","w185","w342","w500","w780","original"],"profile_sizes":["w45","w185","h632","original"],
  #"still_sizes":["w92","w185","w300","original"]},"change_keys":["adult","air_date","also_known_as","alternative_titles",
  #"biography","birthday","budget","cast","certifications","character_names","created_by","crew","deathday","episode","episode_number",
  #"episode_run_time","freebase_id","freebase_mid","general","genres","guest_stars","homepage","images","imdb_id","languages","name","network",
  #"origin_country","original_name","original_title","overview","parts","place_of_birth","plot_keywords","production_code","production_companies",
  #"production_countries","releases","revenue","runtime","season","season_number","season_regular","spoken_languages","status","tagline","title",
  #"translations","tvdb_id","tvrage_id","type","video","videos"]}
  #{"genres":[{"id":28,"name":"Action"},{"id":12,"name":"Adventure"},{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},
  #{"id":80,"name":"Crime"},{"id":99,"name":"Documentary"},{"id":18,"name":"Drama"},{"id":10751,"name":"Family"},{"id":14,"name":"Fantasy"},
  #{"id":36,"name":"History"},{"id":27,"name":"Horror"},{"id":10402,"name":"Music"},{"id":9648,"name":"Mystery"},{"id":10749,"name":"Romance"},
  #{"id":878,"name":"Science Fiction"},{"id":10770,"name":"TV Movie"},{"id":53,"name":"Thriller"},{"id":10752,"name":"War"},{"id":37,"name":"Western"}]}
  def self.popular
    response = HTTParty.get("https://api.themoviedb.org/3/discover/movie?api_key=***REMOVED***&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1");
    response["results"];
  end
  def self.title_search(query)
    response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=***REMOVED***&language=en-US&query=" + "#{query}" + "&page=1&include_adult=false");
    response["results"];
  end
  def self.find_by_api_id(api_id)
    response = HTTParty.get("https://api.themoviedb.org/3/movie/" + "#{api_id}" + "?api_key=***REMOVED***&language=en-US");
  end
end