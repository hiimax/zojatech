import 'package:zojatech/data/data_exception/data_exception.dart';
import 'package:zojatech/data/database/product_db.dart';
import 'package:zojatech/data/remote/remote_services/product_service.dart';

import '../../res/import/import.dart';

class ProductHttpService extends ProductDatabase implements ProductService {
  @override
  Future<List<ProductModel>> getAllProduct() async {
    try {
      final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> updateProduct({required ProductModel product}) async {
    try {
      await update(product);
        final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> addProduct({required ProductModel product}) async {
    try {
      await insert(product);
       final res = await getAll();
      return res;
    } on MyException {
      rethrow;
    }
  }

  @override
  Future<bool> deleteProduct({required int id}) async {
    try {
      await delete(id);
      return true;
    } on MyException {
      rethrow;
    }
  }
}
