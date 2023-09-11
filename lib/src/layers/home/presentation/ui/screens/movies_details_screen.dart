import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/services_locator.dart';
import '../../controllers/movie_controller/movie_details_cubit/movie_details_cubit.dart';
import '../widgets/movies_details_widget.dart';

class MoviesDetailsScreen extends StatelessWidget {
  final int id;
  const MoviesDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            serviceLocator<MovieDetailsCubit>()..getMovieDetails(id),
        lazy: false,
        child: const MovieDetailsWidget(),
      ),
    );
  }
}
