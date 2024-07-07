import 'package:flix_id/presentation/pages/profile_page/methods_profile/profile_item_method.dart';
import 'package:flix_id/presentation/pages/profile_page/methods_profile/user_info_method.dart';
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
              ...userInfo(ref),
              const Divider(),
              profileItem('Update Profile'),
            ],
          ),
        ),
      ],
    );
  }
}
