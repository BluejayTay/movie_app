# Groovie

Groovie is an app for discovering movies using The Movie Database API. Users can see top-rated movies, popular movies, or search by title in the "Movies" section. Once a user logs in, they can  access the Watchlist and Review features of Groovie. Watchlists are edited by adding or removing movies via the ubiqutous "- Watchlist" and "+ Watchlist" buttons, and are sorted by each movie's priority level(Low, Medium, High) that can be changed by the user at any time in their "Watchlist" section. Reviews are composed and posted directly on the movie's info page to be shared with others and can be edited/removed by the user in their "Reviews" section.

See the [deployed app](https://evening-peak-95794.herokuapp.com)

## Technologies Used:
- Ruby 2.7.4
- Rails 6.1.4
- PostgreSQL
- Heroku
- HTML5, CSS, Javascript
- Bootstrap 5.0
- Devise authentication
- Figaro

## Future Additions:
- Option to see additional pages of results beyond the first page (currently limited to first 20 movies listed in given search.)
- Similar movies displayed on a movie's info page.
- A preferences form/profile for users to get recommendations for movies to watch.
- A user "Profile" page that is public to other users.
- A model for "Favorites" so Users can display their favorite movies on their profile page.
- Option to filter searches by streaming services.
- Ability for users to create different watchlists (e.g., Kids, Date Night, etc.).
