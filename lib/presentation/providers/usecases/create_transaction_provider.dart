import 'package:cinematl_app/domain/usecases/create_transaction/create_transaction.dart';
import 'package:cinematl_app/presentation/providers/repositories/transaction_repository_provider.dart/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(CreateTransactionRef ref) =>
    CreateTransaction(
        transactionRepository: ref.watch(transactionRepositoryProvider));
