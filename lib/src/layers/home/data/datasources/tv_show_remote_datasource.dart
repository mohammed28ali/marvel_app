import 'package:dio/dio.dart';
import 'package:marvel_app/src/core/network/api_const.dart';
import 'package:marvel_app/src/core/network/error_message_model.dart';
import 'package:marvel_app/src/core/utils/error/exceptions.dart';

import '../../domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';
import '../models/tv_show_models/tv_show_model.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getAllTvShows();
  Future<TvShowModel> getTvShowsDetails(TvShowDetailsParameters parameters);
}

class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource {
  @override
  Future<List<TvShowModel>> getAllTvShows() async {
    final response = await Dio().get(ApiConst.allTvShowsPath);
    if (response.statusCode == 200) {
      return List<TvShowModel>.from(
        (response.data[ApiConst.data] as List).map(
          (e) => TvShowModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvShowModel> getTvShowsDetails(
      TvShowDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConst.tvShowDetailsPath(parameters.tvshowId));

    if (response.statusCode == 200) {
      return TvShowModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
