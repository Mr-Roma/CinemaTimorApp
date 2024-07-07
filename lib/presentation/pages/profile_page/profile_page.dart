import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/profile_page/methods_profile/profile_item_method.dart';
import 'package:flix_id/presentation/pages/profile_page/methods_profile/user_info_method.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              verticalSpace(20),
              ...userInfo(ref),
              const Divider(),
              verticalSpace(20),
              profileItem('Hafoun Perfil'),
              verticalSpace(20),
              profileItem('Kartera'),
              verticalSpace(20),
              profileItem('Muda Password'),
              verticalSpace(20),
              profileItem('Muda Lian'),
              verticalSpace(20),
              Divider(),
              verticalSpace(20),
              profileItem('Kontaktu Ami'),
              verticalSpace(20),
              profileItem('Privacy Policy'),
              verticalSpace(20),
              profileItem('Termu no kondisaun'),
              verticalSpace(60),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(userDataProvider.notifier).logout();
                  },
                  child: Text('LogOut'),
                ),
              ),
              verticalSpace(20),
              Text(
                'Versaun 0.0.1',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }
}
