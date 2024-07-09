import 'package:cinematl_app/data/repositories/authentication.dart';
import 'package:cinematl_app/domain/entities/result.dart';
import 'package:cinematl_app/presentation/providers/repositories/authentication/authentication_provider.dart';

import '../usecase.dart';

class LogOut implements Usecase<Result<void>, void> {
  final Authentication _authentication;

  LogOut({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
