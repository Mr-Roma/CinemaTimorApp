import 'package:cinematl_app/data/repositories/transaction_repository.dart';
import 'package:cinematl_app/domain/entities/result.dart';
import 'package:cinematl_app/domain/entities/transaction.dart';
import 'package:cinematl_app/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:cinematl_app/domain/usecases/usecase.dart';

class GetTransactions
    implements Usecase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionListResult =
        await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
