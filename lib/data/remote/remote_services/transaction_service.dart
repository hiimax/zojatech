import 'package:zojatech/res/import/import.dart';

abstract class TransactionService {
  Future<List<TransactionModel>> getAllTransaction();
  Future<List<TransactionModel>> updateTransaction(
      {required TransactionModel transaction});
  Future<List<TransactionModel>> addTransaction(
      {required TransactionModel transaction});
  Future<bool> deleteTransaction({required int id});
}
