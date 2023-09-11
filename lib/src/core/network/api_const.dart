class ApiConst {
  static const String baseUrl = 'https://mcuapi.herokuapp.com/api/v1';
  static const String baseCoverUrl = 'https://res.cloudinary.com/augustomarcelo/image/upload/v1675206317/mcuapi/gallery';
  static const String baseTrailerUrl = 'https://players.brightcove.net/5359769168001/BJemW31x6g_default/index.html';
  static trailerUrl(int trailerId) => '$baseTrailerUrl?videoId=$trailerId';

  // Movies
  static const String allMoviesPath = '$baseUrl/movies';
  static String movieDetailsPath(int movieId) => '$allMoviesPath/$movieId';

  static const String baseMovieCoverUrl = '$baseCoverUrl/Movies';
  static movieCoverUrl(String coverPath) => '$baseMovieCoverUrl/$coverPath';

  // Tv Shows
  static const String allTvShowsPath = '$baseUrl/tvshows';
  static String tvShowDetailsPath(int tvShowId) => '$allTvShowsPath/$tvShowId';

  static const String baseTvShowCoverUrl = '$baseCoverUrl/tv_shows';
  static tvShowCoverUrl(String coverPath) => '$baseTvShowCoverUrl/$coverPath';

  static const String data = "data";
}
