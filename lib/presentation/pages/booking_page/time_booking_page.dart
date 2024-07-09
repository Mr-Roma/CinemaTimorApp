import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/presentation/pages/booking_page/time_booking_page_methods/options.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  String? selectedTheather;
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
              child: BackNavigationBar(widget.movieDetail.title),
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
                title: 'Hili Fatin Theater',
                options: theathers,
                selectedItem: selectedTheather,
                onTap: (object) => setState(() {
                      selectedTheather = object;
                    })),
            ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
            )
          ],
        ),
      ],
    ));
  }
}
