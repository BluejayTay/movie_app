# Groovie

Groovie is an app for discovering movies using The Movie Database API. Users can see top-rated movies, popular movies, search by title, and also see recommended movies based on any given movie. Once a user logs in, they can access the Watchlist and Review features of Groovie. Watchlists are edited by adding or removing movies via the ubiqutous "- Watchlist" and "+ Watchlist" buttons. Watchlists are sorted by each movie's priority level(Low, Medium, High), which can be changed by the user in their "Watchlist" section. Reviews are composed and posted directly on the movie's info page to be shared with others and can be edited/removed by the user. Recommended movies are accessed via the "Recommended Movies" button on each movie's info page.

See the [deployed app](https://groovie-app.herokuapp.com)

## Technologies Used:
- Ruby 2.7.4
- Rails 6.1.4
- PostgreSQL
- Heroku
- HTML5, CSS, Javascript
- Bootstrap 5.0
- Devise authentication
- Figaro
- The Movie Database API

## Screenshots:
[Welcome Mobile]
<p style="align:center;"><img src="app/frontend/images/Welcome_mobile.png"  style="height:500px;">
</p>
[Welcome Desktop]
<p align="center">
<img src="app/frontend/images/Welcome_Desktop.png"  height="500">
</p>
[Watchlist Desktop]
<p align="center">
<img src="app/frontend/images/Watchlist_Desktop.png"  height="500">
</p>
[Search Results Desktop]
<p align="center">
<img src="app/frontend/images/Search_Results_Desktop.png"  height="500">
</p>
[Movie Page Desktop]
<p align="center">
<img src="app/frontend/images/Movie_Page_Desktop.png"  height="500">
</p>
[Recommended Movies Desktop]
<p align="center">
<img src="app/frontend/images/Recommended_Movies_Desktop.png"  height="400">
</p>

## Future Enhancements:

- A preferences form/profile for users to get recommendations for movies to watch based on their preferences.
- A user "Profile" page that is public to other users.
- A model for "Favorites" so Users can display their favorite movies on their profile page.
- Ability for users to create different watchlists (e.g., Kids, Date Night, etc.).
- Paginate search results (currently limited to first 20 movies listed in given search.)