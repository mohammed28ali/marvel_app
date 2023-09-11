import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/services_locator.dart';
import '../../controllers/tv_show_controller/tv_show_details/tv_show_details_cubit.dart';
import '../widgets/tv_show_details_widget.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final int id;

  const TvShowDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            serviceLocator<TvShowDetailsCubit>()..getTvShowDetails(id),
        lazy: false,
        child: const TvShowDetailsWidget(),
      ),
    );
  }
}
