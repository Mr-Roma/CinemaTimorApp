// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:cinematl_app/presentation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final List<BottomNavbarItem> items;
  final void Function(int index) onTap;
  final int selectedImage;

  const BottomNavbar({
    Key? key,
    required this.items,
    required this.onTap,
    required this.selectedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              color: Color.fromARGB(200, 12, 12, 17),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items
                .map((e) => GestureDetector(
                      onTap: () => onTap(e.index),
                      child: e,
                    ))
                .toList(),
          ),
        ));
  }
}
