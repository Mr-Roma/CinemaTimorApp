import 'package:cinematl_app/domain/entities/movie_detail.dart';
import 'package:cinematl_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> movieOverview(AsyncValue<MovieDetail?> asyncMovieDetail) => [
      Text(
        'Deskrisaun',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      verticalSpace(10),
      asyncMovieDetail.when(
          data: (movieDetail) =>
              Text(movieDetail != null ? movieDetail.overview : ''),
          error: (eror, StackTrace) => Text(
              'Falha atu load overview husi filme, koko fila-fali iha oras tuirmai'),
          loading: () => const CircularProgressIndicator())
    ];
