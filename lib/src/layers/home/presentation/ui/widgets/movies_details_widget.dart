import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_app/src/core/utils/enums/enums.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_icons.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_strings.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';
import 'package:marvel_app/src/core/utils/shared_widgets/custom_sizedbox_height.dart';
import 'package:marvel_app/src/layers/home/presentation/controllers/movie_controller/movie_details_cubit/movie_details_cubit.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_headline_text.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_text_movie.dart';
import 'package:shimmer/shimmer.dart';

import '../screens/movie_trailer_screen.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsDataState) {
          case RequestApiDataState.dataLoading:
            return const CustomCircularProgressIndicator();
          case RequestApiDataState.dataLoaded:
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: AppSize.s280,
                  flexibleSpace: Stack(
                    children: [
                      FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: state.movieDetails!.coverUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MovieTrailerScreen(
                                      movieTrailerId: state.movieDetails!.id,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                AppIcons.play,
                                color: AppColors.white,
                                size: 50,
                              ),
                            ),
                            const CustomTextMovie(
                              text: AppStrings.play,
                              textColor: AppColors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  iconTheme: const IconThemeData(
                    color: AppColors.white,
                  ),
                  actions: const [
                    Padding(
                      padding: AppEdgeInsetsPaddings.appBarActionsPadding,
                      child: Icon(AppIcons.moreHoriz),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: AppSize.s50,
                    duration: AppDurations.milliSeconds800,
                    child: Padding(
                      padding: AppEdgeInsetsPaddings.defaultDetailsWidget,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  state.movieDetails!.title,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s20,
                                    fontWeight: AppFontWeight.bold,
                                    letterSpacing: AppSize.s1,
                                  ),
                                ),
                              ),
                              const Icon(AppIcons.bookMark),
                            ],
                          ),
                          const CustomSizedBoxHeight(height: AppSize.s12),
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.length,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.regular,
                                    color: AppColors.grey4,
                                  ),
                                ),
                                Text(
                                  AppStrings.director,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.regular,
                                    color: AppColors.grey4,
                                  ),
                                ),
                                Text(
                                  AppStrings.phase,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.regular,
                                    color: AppColors.grey4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CustomSizedBoxHeight(height: AppSize.s6),
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _showDuration(state.movieDetails!.duration),
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  state.movieDetails!.directedBy,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  state.movieDetails!.phase.toString(),
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CustomSizedBoxHeight(height: AppSize.s24),
                          const CustomHeadLineText(
                              headLine: AppStrings.description),
                          const CustomSizedBoxHeight(height: AppSize.s12),
                          Text(
                            state.movieDetails!.overview,
                            style: GoogleFonts.mulish(
                              fontSize: AppFontSize.s14,
                              fontWeight: AppFontWeight.regular,
                              color: AppColors.grey4,
                            ),
                          ),
                          const CustomSizedBoxHeight(height: AppSize.s24),
                          const CustomHeadLineText(
                              headLine: AppStrings.relatedMovies),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: AppEdgeInsetsPaddings.defaultRelatedMoviesWidget,
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final relatedMovies =
                            state.movieDetails!.movieRecommendation[index];
                        return FadeInUp(
                          from: AppSize.s50,
                          duration: AppDurations.milliSeconds800,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                child: CachedNetworkImage(
                                  imageUrl: relatedMovies.coverUrl,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  height: 180.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                relatedMovies.title,
                                style: GoogleFonts.mulish(
                                  fontSize: AppFontSize.s14,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount:
                          state.movieDetails!.movieRecommendation.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 0.4,
                      crossAxisCount: 3,
                    ),
                  ),
                ),
              ],
            );
          case RequestApiDataState.dataError:
            return Center(
              child: Text(state.movieDetailsMessageState),
            );
        }
      },
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
