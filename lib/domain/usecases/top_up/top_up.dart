import 'package:cinematl_app/data/repositories/transaction_repository.dart';
import 'package:cinematl_app/data/repositories/user_repository.dart';
import 'package:cinematl_app/domain/entities/result.dart';
import 'package:cinematl_app/domain/entities/transaction.dart';
import 'package:cinematl_app/domain/usecases/create_transaction/create_transaction.dart';
import 'package:cinematl_app/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:cinematl_app/domain/usecases/top_up/top_up_param.dart';
import 'package:cinematl_app/domain/usecases/usecase.dart';

class TopUp implements Usecase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);
    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var createTransactionParam = CreateTransactionParam(
        transaction: Transaction(
            id: 'flxtp-$transactionTime-${params.uid}',
            uid: params.uid,
            title: 'Top Up',
            adminFee: 0,
            total: -params.amount,
            transactionTime: transactionTime));

    var createTransactionResult =
        await createTransaction.call(createTransactionParam);

    if (createTransactionResult is Success) {
      return const Result.success(null);
    } else if (createTransactionResult is Failed) {
      return const Result.failed('Failed to Top Up');
    }

    // Default return statement
    return const Result.failed('Unexpected error occurred');
  }
}
