import 'package:cinematl_app/domain/usecases/get_loggedin_user/get_loggedin_user.dart';
import 'package:cinematl_app/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:cinematl_app/presentation/providers/repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
