import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';

class UploadProfilePictureParam {
  final File ImagePath;
  final User user;

  UploadProfilePictureParam({required this.ImagePath, required this.user});
}
