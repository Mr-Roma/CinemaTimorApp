import 'package:cinematl_app/presentation/misc/methods.dart';
import 'package:cinematl_app/presentation/widgets/selectable_card.dart';
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
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: options
              .map((e) => Padding(
                    padding: EdgeInsets.only(
                        left: e == options.first ? 24 : 0,
                        right: e == options.last ? 24 : 10),
                    child: SelectableCard(
                        text: converter != null ? converter(e) : e.toString(),
                        isSelected: e == selectedItem,
                        isEnable: isOptionEnable?.call(e) ?? true,
                        onTap: () => onTap(e)),
                  ))
              .toList()),
    )
  ];
}
