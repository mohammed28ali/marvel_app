import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/core/utils/enums/enums.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_icons.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';
import 'package:marvel_app/src/core/utils/shared_widgets/custom_sizedbox_height.dart';
import 'package:marvel_app/src/layers/home/presentation/controllers/movie_controller/movie_cubit/movie_cubit.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/screens/movies_details_screen.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_sizedbox_movie.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_text_movie.dart';
import 'package:shimmer/shimmer.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  Widget _buildWidgetWhenDataIsLoading() {
    return const CustomSizedBoxMovie(child: CustomCircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      buildWhen: (previous, current) =>
          previous.allMoviesDataState != current.allMoviesDataState,
      builder: (context, state) {
        switch (state.allMoviesDataState) {
          case RequestApiDataState.dataLoading:
            return _buildWidgetWhenDataIsLoading();
          case RequestApiDataState.dataLoaded:
            return FadeIn(
              duration: AppDurations.milliSeconds800,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: AppEdgeInsetsPaddings.movieListViewPadding,
                itemCount: state.allMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.allMovies[index];
                  return Container(
                    width: 350,
                    padding:
                        AppEdgeInsetsPaddings.movieListViewContainerPadding,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MoviesDetailsScreen(id: movie.id),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(6),
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: AppSize.s85,
                              height: AppSize.s145,
                              imageUrl: movie.coverUrl,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: AppColors.white,
                                highlightColor: AppColors.transparent,
                                child: Container(
                                  width:100,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s8),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(AppIcons.error),
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextMovie(
                                  text: movie.title,
                                  fontSize: AppFontSize.s16,
                                  fontWeight: AppFontWeight.bold,
                                ),
                                const CustomSizedBoxHeight(height: AppSize.s20),
                                CustomTextMovie(
                                  text: movie.directedBy,
                                ),
                                const CustomSizedBoxHeight(height: AppSize.s20),
                                Row(
                                  children: [
                                    const Icon(AppIcons.time),
                                    const SizedBox(width: AppSize.s4),
                                    CustomTextMovie(text: movie.releaseDate),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          case RequestApiDataState.dataError:
            return CustomSizedBoxMovie(
              child: Center(
                child: Text(state.allMoviesMessageState),
              ),
            );
        }
      },
    );
  }
}
