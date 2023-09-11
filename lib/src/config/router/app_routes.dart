import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/services_locator.dart';
import '../../layers/auth/presentation/cubit/auth_cubit.dart';
import '../../layers/auth/presentation/screens/login_screen.dart';
import '../../layers/auth/presentation/screens/register_screen.dart';
import '../../layers/home/presentation/controllers/movie_controller/movie_cubit/movie_cubit.dart';
import '../../layers/home/presentation/controllers/tv_show_controller/tv_show_cubit/tv_show_cubit.dart';
import '../../layers/home/presentation/ui/screens/home_screen.dart';
import '../../layers/home/presentation/ui/screens/movie_trailer_screen.dart';
import '../../layers/home/presentation/ui/screens/movies_details_screen.dart';
import '../../layers/home/presentation/ui/screens/tv_show_details_screen.dart';
import '../../layers/home/presentation/ui/screens/tv_show_trailer_screen.dart';

class AppRoutesStrings {
  static const String loginScreenRoute = "/loginScreen";
  static const String registerScreenRoute = "/registerScreen";
  static const String homeScreenRoute = "/homeScreen";
  static const String movieDetailsScreenRoute = "/movieDetailsScreen";
  static const String tvShowDetailsScreenRoute = "/tvShowDetailsScreen";
  static const String movieTrailerScreenRoute = "/movieTrailerScreen";
  static const String tvShowTrailerScreenRoute = "/tvShowTrailerScreen";
}

class AppRoutes {
  static Route<dynamic> generatePageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutesStrings.loginScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutesStrings.registerScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ReigsterScreen(),
        );
      case AppRoutesStrings.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    serviceLocator<TvShowCubit>()..getAllTvShows(),
              ),
              BlocProvider(
                create: (context) =>
                    serviceLocator<MovieCubit>()..getAllMovies(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case AppRoutesStrings.movieDetailsScreenRoute:
        final movieId = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MoviesDetailsScreen(id: movieId),
        );
      case AppRoutesStrings.tvShowDetailsScreenRoute:
        final tvShowId = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TvShowDetailsScreen(id: tvShowId),
        );
      case AppRoutesStrings.movieTrailerScreenRoute:
        final movieTrailerId = routeSettings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MovieTrailerScreen(
                  movieTrailerId: movieTrailerId,
                ));
      case AppRoutesStrings.tvShowTrailerScreenRoute:
        final tvShowTrailerId = routeSettings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => TvShowTrailerScreen(tvShowId: tvShowTrailerId));
      default:
        return noRouteExist();
    }
  }

  static Route<dynamic> noRouteExist() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('No Route Exist'),
            ),
          )),
    );
  }
}
