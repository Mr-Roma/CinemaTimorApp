// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('MAIN PAGE'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(ref.watch(userDataProvider).when(
                data: (data) => data.toString(),
                error: (error, stackTrace) => '',
                loading: () => 'Loading...,')),
            ElevatedButton(
                onPressed: () {
                  ref.read(userDataProvider.notifier).logout();
                },
                child: Text('LOGOUT'))
          ],
        ),
      ),
    );
  }
}
