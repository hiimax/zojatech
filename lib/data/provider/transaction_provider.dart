

import '../../res/import/import.dart';

class TransactionProvider extends ChangeNotifier {
  static TransactionProvider? _instance;
  static late ApiService apiService;
  static late TransactionService service;

  TransactionProvider() {
    service = TransactionHttpService();
    apiService = ApiServiceImpl();
  }

  static TransactionProvider get instance {
    _instance ??= TransactionProvider();
    return _instance!;
  }

  TransactionModel? _transaction;

  TransactionModel? get transaction => _transaction;

  List<TransactionModel>? _transactions;

  List<TransactionModel>? get transactions => _transactions;

  Future<void> initiateGetTransaction() async {
    try {
      _transactions = await service.getAllTransaction();
    } finally {
      notifyListeners();
    }
  }

  Future<void> getAllTransaction({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required ctx,
  }) async {
    try {
      _transactions = await service.getAllTransaction();
      if (_transaction == null) {
        {
          showErrorToast(
              message: 'Unable to fetch transactions. Please try again.',
              context: ctx);

          onFailure?.call();
        }
      } else {
        showSuccessToast(message: 'Transactions Fetched ', context: ctx);
        onSuccess?.call();
      }
    } catch (e) {
      print(e);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateTransaction({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required TransactionModel transaction,
    required ctx,
  }) async {
    try {
      _transactions = await service.updateTransaction(transaction: transaction);
      showSuccessToast(message: 'Transaction Updated ', context: ctx);
      onSuccess?.call();
      return;
    } catch (e) {
      print(e);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> addTransaction({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required TransactionModel transaction,
    required ctx,
  }) async {
    try {
      _transactions = await service.addTransaction(transaction: transaction);
      showSuccessToast(message: 'Transaction Added ', context: ctx);
      onSuccess?.call();
      return;
    } catch (e, s) {
      print(e);
      print(s);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteTransaction({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required int id,
    required ctx,
  }) async {
    try {
      bool isDeleted = await service.deleteTransaction(id: id);
      if (isDeleted) {
        showSuccessToast(message: 'Transaction Deleted ', context: ctx);
        _transactions = await service.getAllTransaction();
        onSuccess?.call();
      } else {
        showErrorToast(message: 'Unable to delete transaction', context: ctx);
        onFailure?.call();
      }
    } catch (e) {
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }
}
