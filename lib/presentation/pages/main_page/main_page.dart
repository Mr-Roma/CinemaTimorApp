// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/domain/entities/user.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final User user;

  const MainPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAIN PAGE'),
      ),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
