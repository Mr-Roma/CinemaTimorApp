import 'package:cinematl_app/domain/usecases/top_up/top_up.dart';
import 'package:cinematl_app/presentation/providers/repositories/transaction_repository_provider.dart/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(TopUpRef ref) =>
    TopUp(transactionRepository: ref.watch(transactionRepositoryProvider));
