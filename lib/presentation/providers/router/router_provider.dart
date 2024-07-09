import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/pages/detail_page/detail_page.dart';
import 'package:flix_id/presentation/pages/login_page/login_page.dart';
import 'package:flix_id/presentation/pages/main_page/main_page.dart';
import 'package:flix_id/presentation/pages/register_page/register_page.dart';
import 'package:flix_id/presentation/pages/splash_page/splash_page.dart'; // import the SplashPage
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
        routes: [
          GoRoute(
              path: '/main',
              name: 'main',
              builder: (context, state) => MainPage()),
          GoRoute(
              path: '/login',
              name: 'login',
              builder: (context, state) => LoginPage()),
          GoRoute(
              path: '/register',
              name: 'register',
              builder: (context, state) => RegisterPage()),
          GoRoute(
              path: '/splash',
              name: 'splash',
              builder: (context, state) =>
                  SplashPage()), // add the SplashPage route
          GoRoute(
              path: '/detail',
              name: 'detail',
              builder: (context, state) => DetailPage(
                  movie: state.extra as Movie)), // add the SplashPage route
        ],
        initialLocation: '/splash',
        debugLogDiagnostics: false); // set the initialLocation to '/splash'