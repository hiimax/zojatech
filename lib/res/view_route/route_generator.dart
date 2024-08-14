import '../import/import.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  RouteGenerator._();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/${RouteNames.signup}',
    errorBuilder: (context, state) => const CustomError(
      errorDetails: null,
    ),
    redirect: (BuildContext context, GoRouterState state) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final provider = context.read<AuthenticationProvider>();
      final isAuthenticated =
          await provider.getUser(token: prefs.getString('token') ?? '');
      if (isAuthenticated == false) {
        return '/${RouteNames.login}';
      } else {
        return null;
      }
    },
    routes: <RouteBase>[
      GoRoute(
        name: RouteNames.splash,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RouteNames.signup,
        path: '/${RouteNames.signup}',
        builder: (context, state) => const CreateAccountScreen(),
        routes: <RouteBase>[
          // Add child routes
          GoRoute(
            path: RouteNames
                .signupSuccess, // NOTE: Don't need to specify "/" character for router’s parents
            builder: (context, state) {
              return const CreateAccountSuccessScreen();
            },
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.login,
        path: '/${RouteNames.login}',
        builder: (context, state) => const WelcomeBackScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: RouteNames.dashboard,
                path: '/dashboard',
                builder: (context, state) => const DashBoardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: RouteNames.product,
                path: '/${RouteNames.product}',
                builder: (context, state) => const ProductScreen(),
                routes: [
                  GoRoute(
                      name: RouteNames.addProduct,
                      path: RouteNames.addProduct,
                      builder: (context, state) {
                        return AddProductScreen(
                          isEditEnabled: bool.tryParse(state
                                  .uri.queryParameters['isEditEnabled']!) ??
                              false,
                          product: state.extra as ProductModel?,
                        );
                      }),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: RouteNames.transaction,
                path: '/${RouteNames.transaction}',
                builder: (context, state) => const TransactionScreen(),
                routes: [
                  GoRoute(
                      name: RouteNames.addTransaction,
                      path: RouteNames.addTransaction,
                      builder: (context, state) {
                        return AddTransactionScreen(
                          isEditEnabled: bool.tryParse(state
                                  .uri.queryParameters['isEditEnabled']!) ??
                              false,
                          transaction: state.extra as TransactionModel?,
                        );
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
