import 'package:cinematl_app/presentation/misc/methods.dart';
import 'package:cinematl_app/presentation/pages/movie_pages/movie_list.dart';
import 'package:cinematl_app/presentation/pages/movie_pages/promotion_list.dart';
import 'package:cinematl_app/presentation/pages/movie_pages/search_bar.dart';
import 'package:cinematl_app/presentation/pages/movie_pages/user_info.dart';
import 'package:cinematl_app/presentation/providers/movie/now_playing_provider.dart';
import 'package:cinematl_app/presentation/providers/movie/upcoming_provider.dart';
import 'package:cinematl_app/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = const [
    'popcorn.jpg',
    'buy1get1.jpg'
  ];

  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpace(40),
            searchBar(context),
            verticalSpace(24),
            ...movieList(
              title: 'Filme Atual',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                ref.read(routerProvider).pushNamed('detail', extra: movie);
              },
            ),
            verticalSpace(30),
            ...promotionList(promotionImageFileNames),
            verticalSpace(30),
            ...movieList(
              title: 'Filme Tuirmai',
              movies: ref.watch(upcomingProvider),
              onTap: (movie) {
                ref.read(routerProvider).pushNamed('detail', extra: movie);
              },
            ),
            verticalSpace(100),
          ],
        )
      ],
    );
  }
}
