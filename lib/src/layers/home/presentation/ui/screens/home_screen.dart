import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_strings.dart';
import 'package:marvel_app/src/core/utils/shared_widgets/custom_singlechildscrollview.dart';
import 'package:marvel_app/src/core/utils/shared_widgets/custom_sizedbox_height.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_category_section.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_headline_text.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/custom_svg_icon.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/movies_widget.dart';
import 'package:marvel_app/src/layers/home/presentation/ui/widgets/tv_shows_widget.dart';
import '../../../../../core/utils/app_resources/app_icons.dart';
import '../../../../../core/utils/shared/app_botoom_nav_bar.dart';
import '../../../../../core/utils/app_resources/app_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: AppEdgeInsetsPaddings.appBarLeadingPadding,
        child: Container(
          padding: AppEdgeInsetsPaddings.appBarLeadingIconPadding,
          child: const CustomSvgIcon(icon: AppSvgIcons.menu),
        ),
      ),
      title: const CustomHeadLineText(headLine: AppStrings.marvel),
      centerTitle: true,
      actions: [
        Padding(
          padding: AppEdgeInsetsPaddings.appBarActionsPadding,
          child: InkWell(
            child: const CustomSvgIcon(icon: AppSvgIcons.notification),
            onTap: () {
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTvShowSection() {
    return CustomCategorySection(
      nameOfCategory: AppStrings.tvShows,
      pressSeeMore: () {},
      widgetOfCategory: const TvShowsWidget(),
    );
  }

  Widget _buildMovieSection() {
    return CustomCategorySection(
      nameOfCategory: AppStrings.movies,
      pressSeeMore: () {},
      widgetOfCategory: const MoviesWidget(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(items: AppLists.items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomSingleChildScrollView(
        children: [
          _buildTvShowSection(),
          const CustomSizedBoxHeight(height: AppSize.s10),
          _buildMovieSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
