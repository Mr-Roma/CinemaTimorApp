import 'package:flix_id/domain/usecases/logout/logout.dart';
import 'package:flix_id/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
LogOut logout(LogoutRef ref) =>
    LogOut(authentication: ref.watch(authenticationProvider));
