// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/bottom_navbar.dart';
import 'package:flix_id/presentation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next) {
      if (previous != null && next is AsyncData && next.value == null) {
        ref.read(routerProvider).goNamed('login');
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: [
              Center(child: Text('Pagina Filme')),
              Center(child: Text('Pagina Tickete')),
              Center(child: Text('Pagina Profile')),
            ],
          ),
          BottomNavbar(
              items: [
                BottomNavbarItem(
                    index: 0,
                    isSelected: selectedPage == 0,
                    title: 'Varanda',
                    image: 'assets/movie.png',
                    selectedImage: 'assets/movie-selected.png'),
                BottomNavbarItem(
                    index: 1,
                    isSelected: selectedPage == 1,
                    title: 'Tickete',
                    image: 'assets/ticket.png',
                    selectedImage: 'assets/ticket-selected.png'),
                BottomNavbarItem(
                    index: 2,
                    isSelected: selectedPage == 2,
                    title: 'Profile',
                    image: 'assets/profile.png',
                    selectedImage: 'assets/profile-selected.png'),
              ],
              onTap: (index) {
                selectedPage = index;
                pageController.animateToPage(selectedPage,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
              selectedImage: 0)
        ],
      ),
    );
  }
}
