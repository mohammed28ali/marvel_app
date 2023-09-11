import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/services_locator.dart';
import '../../controllers/movie_controller/movie_details_cubit/movie_details_cubit.dart';
import '../widgets/movie_trailer_widget.dart';

class MovieTrailerScreen extends StatelessWidget {
  final int movieTrailerId;

  const MovieTrailerScreen({super.key, required this.movieTrailerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<MovieDetailsCubit>()..getMovieTrailer(movieTrailerId),
      lazy: false,
      child:  MovieTrailerWidget(movieTrailerId as String),
    );
  }
}
