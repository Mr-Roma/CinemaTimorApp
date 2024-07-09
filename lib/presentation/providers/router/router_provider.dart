import 'package:cinematl_app/domain/entities/movie.dart';
import 'package:cinematl_app/domain/entities/movie_detail.dart';
import 'package:cinematl_app/domain/entities/transaction.dart';
import 'package:cinematl_app/presentation/pages/booking_page/time_booking_page.dart';
import 'package:cinematl_app/presentation/pages/detail_page/detail_page.dart';
import 'package:cinematl_app/presentation/pages/login_page/login_page.dart';
import 'package:cinematl_app/presentation/pages/main_page/main_page.dart';
import 'package:cinematl_app/presentation/pages/register_page/register_page.dart';
import 'package:cinematl_app/presentation/pages/seat_booking_page/seat_booking_page.dart';
import 'package:cinematl_app/presentation/pages/splash_page/splash_page.dart'; // import the SplashPage
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
              builder: (context, state) =>
                  DetailPage(movie: state.extra as Movie)),
          GoRoute(
              path: '/time-booking',
              name: 'time-booking',
              builder: (context, state) =>
                  TimeBookingPage(state.extra as MovieDetail)),
          GoRoute(
              path: '/seat-booking',
              name: 'seat-booking',
              builder: (context, state) => SeatBookingPage(
                  transactionDetail:
                      state.extra as (MovieDetail, Transaction))),
        ],
        initialLocation: '/splash',
        debugLogDiagnostics: false); // set the initialLocation to '/splash'