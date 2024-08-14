import 'package:zojatech/res/import/import.dart';

abstract class ProductService {
  Future<List<ProductModel>> getAllProduct();
  Future<List<ProductModel>> updateProduct({required ProductModel product});
  Future<List<ProductModel>> addProduct({required ProductModel product});
  Future<bool> deleteProduct({required int id});
}
