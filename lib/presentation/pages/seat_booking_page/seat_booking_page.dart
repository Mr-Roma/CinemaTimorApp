import 'package:cinematl_app/domain/entities/movie_detail.dart';
import 'package:cinematl_app/domain/entities/transaction.dart';
import 'package:cinematl_app/presentation/providers/movie/movie_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const SeatBookingPage({Key? key, required this.transactionDetail});

  @override
  _SeatBookingPageState createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;
    return Scaffold(
      body: Center(
        child: Text(transaction.toString()),
      ),
    );
  }
}
