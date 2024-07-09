import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

List<Widget> options<T>({
  required String title,
  required List<T> options,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
}) {
  return [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    verticalSpace(10),
  ];
}
