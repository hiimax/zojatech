import 'package:zojatech/data/remote/remote_services/product_service.dart';
import 'package:zojatech/repository/products/product_http_service.dart';

import '../../res/import/import.dart';

class ProductsProvider extends ChangeNotifier {
  static ProductsProvider? _instance;
  static late ApiService apiService;
  static late ProductService service;

  ProductsProvider() {
    service = ProductHttpService();
    apiService = ApiServiceImpl();
  }

  static ProductsProvider get instance {
    _instance ??= ProductsProvider();
    return _instance!;
  }

  ProductModel? _product;

  ProductModel? get product => _product;

  List<ProductModel>? _products;

  List<ProductModel>? get products => _products;

  Future<void> initiateGetProduct() async {
    try {
      _products = await service.getAllProduct();
    } finally {
      notifyListeners();
    }
  }

  Future<void> getAllProduct({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required ctx,
  }) async {
    try {
      _products = await service.getAllProduct();
      if (_product == null) {
        {
          showErrorToast(
              message: 'Unable to fetch products. Please try again.',
              context: ctx);

          onFailure?.call();
        }
      } else {
        showSuccessToast(message: 'Products Fetched ', context: ctx);
        onSuccess?.call();
      }
    } catch (e) {
      print(e);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateProduct({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required ProductModel product,
    required ctx,
  }) async {
    try {
      _products = await service.updateProduct(product: product);
      showSuccessToast(message: 'Product Updated ', context: ctx);
      onSuccess?.call();
      return;
    } catch (e) {
      print(e);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> addProduct({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required ProductModel product,
    required ctx,
  }) async {
    try {
      _products = await service.addProduct(product: product);
      showSuccessToast(message: 'Product Added ', context: ctx);
      onSuccess?.call();
      return;
    } catch (e,s) {
      print(e);
      print(s);
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteProduct({
    required VoidCallback? onFailure,
    required VoidCallback? onSuccess,
    required int id,
    required ctx,
  }) async {
    try {
      bool isDeleted = await service.deleteProduct(id: id);
      if (isDeleted) {
        showSuccessToast(message: 'Product Deleted ', context: ctx);
        _products = await service.getAllProduct();
        onSuccess?.call();
      } else {
        showErrorToast(message: 'Unable to delete product', context: ctx);
        onFailure?.call();
      }
    } catch (e) {
      onFailure?.call();
    } finally {
      notifyListeners();
    }
  }
}
