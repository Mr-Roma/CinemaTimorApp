import 'dart:io';

import 'package:cinematl_app/domain/entities/user.dart';

class UploadProfilePictureParam {
  final File ImagePath;
  final User user;

  UploadProfilePictureParam({required this.ImagePath, required this.user});
}
