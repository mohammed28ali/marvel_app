import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/core/utils/enums/enums.dart';
import 'package:marvel_app/src/layers/home/presentation/controllers/movie_controller/movie_details_cubit/movie_details_cubit.dart';
import 'package:video_player/video_player.dart';
import 'custom_circular_progress_indicator.dart';

class MovieTrailerWidget extends StatefulWidget {
  late final String _movieTrailerUrl;
   MovieTrailerWidget(this._movieTrailerUrl, {Key? key}) : super(key: key);

  @override
  State<MovieTrailerWidget> createState() => _MovieTrailerWidgetState();
}

class _MovieTrailerWidgetState extends State<MovieTrailerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget._movieTrailerUrl))..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
      switch (state.movieTrailerDataState) {
        case RequestApiDataState.dataLoading:
          return const CustomCircularProgressIndicator();
        case RequestApiDataState.dataLoaded:
          widget._movieTrailerUrl = state.movieTrailer!.coverUrl;
          return Scaffold(
            appBar: AppBar(
              title: Text(state.movieTrailer!.title),
            ),
            body: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          );
        case RequestApiDataState.dataError:
          return Center(
            child: Text(state.movieDetailsMessageState),
          );
      }
    });
  }
}
