// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';

class MoviesRepo {
  ApiService apiService;
  MoviesRepo({
    required this.apiService,
  });

  Future<({MoviesModel? moviesModel, bool success})> getNowPlayingMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesNowPlaying,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          'release_date.gte': '{min_date}',
          'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel: moviesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching now playing movies: ${e.toString()}');
      return (moviesModel: null, success: false);
    }
  }

  Future<({MoviesModel? moviesModel, bool success})> getMostPopularMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesMostPopular,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          // 'release_date.gte': '{min_date}',
          // 'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel: moviesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching most popular movies: ${e.toString()}');
      return (moviesModel: null, success: false);
    }
  }

  Future<({MoviesModel? moviesModel, bool success})> getTopRatedMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesTopRated,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          // 'release_date.gte': '{min_date}',
          // 'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel: moviesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching top rated movies: ${e.toString()}');
      return (moviesModel: null, success: false);
    }
  }

  Future<({MoviesModel? moviesModel, bool success})> getUpcomingMovies(
      {required int page}) async {
    try {
      final response = await apiService.get(
        endPoint: ApiEndPoints.moviesUpcoming,
        queryParameters: {
          'language': 'en-US',
          'page': page,
          'sort_by': 'popularity.desc',
          // 'release_date.gte': '{min_date}',
          // 'release_date.lte': '{max_date},'
        },
      );
      MoviesModel moviesModel = MoviesModel.fromJson(response);
      return (moviesModel: moviesModel, success: true);
    } catch (e) {
      debugPrint('Error while fetching upcoming movies: ${e.toString()}');
      return (moviesModel: null, success: false);
    }
  }

  Future<({MovieDetailsModel? movieDetails, bool success})> getMovieDetails(
      {required int movieId}) async {
    try {
      final String endPoint = '/movie/$movieId';
      final response = await apiService.get(
        endPoint: endPoint,
        queryParameters: {
          'language': 'en-US',
        },
      );
      MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(response);
      return (movieDetails: movieDetails, success: true);
    } catch (e) {
      debugPrint('Error while fetching movie details: ${e.toString()}');
      return (movieDetails: null, success: false);
    }
  }
}
