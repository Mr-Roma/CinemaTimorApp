import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileItem(String title, {void Function()? onTap}) => GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Icon(Icons.arrow_forward_ios)],
      ),
    );
