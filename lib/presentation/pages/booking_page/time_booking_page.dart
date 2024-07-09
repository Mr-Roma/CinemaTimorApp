import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/misc/constant.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/booking_page/time_booking_page_methods/options.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;
  const TimeBookingPage(this.movieDetail, {Key? key}) : super(key: key);

  @override
  _TimeBookingPageState createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  final List<String> theathers = [
    'XXI Timor Plaza',
    'XXI Colmera',
    'CGV Bidau Santana',
    'CGV Manleuana'
  ];
  final List<DateTime> dates = List.generate(7, (index) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date.add(Duration(days: index));
  });

  final List<int> hours = List.generate(8, (index) => index + 12);
  String? selectedTheather;
  DateTime? selectedDate;
  int? selectedHour;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: BackNavigationBar(
                widget.movieDetail.title,
                onTap: () => ref.read(routerProvider).pop(),
              ),
              //Backdrop image
              //Teater Options
              // Date Options
              // Time Options
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: NetworkImageCard(
                width: MediaQuery.of(context).size.width - 48,
                height: (MediaQuery.of(context).size.width - 48) * 0.6,
                borderRadius: 15,
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${widget.movieDetail.backdropPath ?? widget.movieDetail.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            ...options(
                title: 'Hili Fatin Theatru',
                options: theathers,
                selectedItem: selectedTheather,
                onTap: (object) => setState(() {
                      selectedTheather = object;
                    })),
            verticalSpace(24),
            ...options(
                title: 'Hili Loron',
                options: dates,
                selectedItem: selectedDate,
                converter: (date) => DateFormat('EEE, d MMMM y').format(date),
                onTap: (object) => setState(() {
                      selectedDate = object;
                    })),
            verticalSpace(24),
            ...options(
              title: 'Hili Oras',
              options: hours,
              selectedItem: selectedHour,
              onTap: (object) => setState(() {
                selectedHour = object;
              }),
              converter: (object) => '$object:00',
              isOptionEnable: (hour) =>
                  selectedDate != null &&
                  DateTime(selectedDate!.year, selectedDate!.month,
                          selectedDate!.day, hour)
                      .isAfter(DateTime.now()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (selectedDate == null ||
                        selectedHour == null ||
                        selectedTheather == null) {
                      context.showSnackBar(
                          "Favor ida hili Opsaun sira nee'ebe iha");
                    } else {
                      Transaction transaction = Transaction(
                          uid: ref.read(userDataProvider).value!.uid,
                          title: widget.movieDetail.title,
                          adminFee: 2,
                          total: 0,
                          watchingTime: DateTime(
                                  selectedDate!.year,
                                  selectedDate!.month,
                                  selectedDate!.day,
                                  selectedHour!)
                              .millisecondsSinceEpoch,
                          transactionImage: widget.movieDetail.posterPath,
                          theaterName: selectedTheather!);
                      ref.read(routerProvider).pushNamed('seat-booking',
                          extra: (widget.movieDetail, transaction));
                    }
                  },
                  child: Text('Kontinua'),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
