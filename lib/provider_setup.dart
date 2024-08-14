import 'package:provider/single_child_widget.dart';
import 'package:zojatech/data/provider/product_provider.dart';
import 'package:zojatech/data/provider/transaction_provider.dart';
import 'package:zojatech/res/import/import.dart';

import 'data/provider/auth_provider.dart';

// final locationProvider = ChangeNotifierProvider((ref) => LocationProvider());
// final authenticationProvider =
//     ChangeNotifierProvider((ref) => AuthenticationProvider());
// final propertyManagementProvider =
//     ChangeNotifierProvider((ref) => PropertyManagementProvider());

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ChangeNotifierProvider(
      create: (_) => ProductsProvider()..initiateGetProduct()),
  ChangeNotifierProvider(
      create: (_) => TransactionProvider()..initiateGetTransaction()),
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
