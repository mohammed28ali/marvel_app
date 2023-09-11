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
import 'package:marvel_app/src/layers/home/presentation/controllers/tv_show_controller/tv_show_details/tv_show_details_cubit.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_headline_text.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_text_movie.dart';

class TvShowDetailsWidget extends StatelessWidget {
  const TvShowDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        switch (state.tvShowDetailsDataState) {
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
                          imageUrl: state.tvShowDetails!.coverUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.play,
                                color: AppColors.white,
                                size: AppSize.s50,
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
                                  state.tvShowDetails!.title,
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
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.season,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.regular,
                                    color: AppColors.grey4,
                                  ),
                                ),
                                Text(
                                  AppStrings.episodes,
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
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.tvShowDetails!.season.toString(),
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  state.tvShowDetails!.numberEpisodes
                                      .toString(),
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  state.tvShowDetails!.directedBy,
                                  style: GoogleFonts.mulish(
                                    fontSize: AppFontSize.s14,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  state.tvShowDetails!.phase.toString(),
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
                            state.tvShowDetails!.overview,
                            style: GoogleFonts.mulish(
                              fontSize: AppFontSize.s14,
                              fontWeight: AppFontWeight.regular,
                              color: AppColors.grey4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ), // Tab(text: 'More like this'.toUpperCase()),
              ],
            );
          case RequestApiDataState.dataError:
            return Center(
              child: Text(state.tvShowDetailsMessageState),
            );
        }
      },
    );
  }
}
