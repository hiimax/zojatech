



import '../../res/import/import.dart';

class TransactionHttpService extends TransactionDataBase implements TransactionService {
  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    try {
      final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> updateTransaction({required TransactionModel transaction}) async {
    try {
      await update(transaction);
        final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> addTransaction({required TransactionModel transaction}) async {
    try {
      await insert(transaction);
       final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<bool> deleteTransaction({required int id}) async {
    try {
      await delete(id);
      return true;
    } on MyException {
      rethrow;
    }
  }
}
