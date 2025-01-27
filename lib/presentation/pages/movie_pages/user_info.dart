import 'package:cinematl_app/presentation/extensions/int_extension.dart';
import 'package:cinematl_app/presentation/misc/methods.dart';
import 'package:cinematl_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget userInfo(WidgetRef ref) => Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: ref.watch(userDataProvider).valueOrNull?.photoUrl !=
                            null
                        ? NetworkImage(ref
                            .watch(userDataProvider)
                            .valueOrNull!
                            .photoUrl!) as ImageProvider
                        : AssetImage('assets/profile_image.png'),
                    fit: BoxFit.cover)),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${getGreeting()}, ${ref.watch(userDataProvider).when(data: (user) => user?.name.split(' ').first ?? '', error: (error, stackTrace) => '', loading: () => 'Loading')}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Mai sosa imi-nia Filme Favoritu!',
                style: TextStyle(fontSize: 12),
              ),
              verticalSpace(5),
              GestureDetector(
                onTap: () {
                  //Go to Wallet Page
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Image.asset('assets/wallet.png'),
                    ),
                    horizontalSpace(10),
                    Text(
                      ref.watch(userDataProvider).when(
                          data: (user) =>
                              (user?.balance ?? 0).toIDRCurrencyFormat(),
                          error: (error, StackTrace) => "USD  ",
                          loading: () => 'Loading...'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

String getGreeting() {
  var hour = -DateTime.now().hour;
  if (hour < 12) {
    return 'Bomdia';
  } else if (hour < 18) {
    return 'Boatarde';
  } else {
    return 'Boanoite';
  }
}
