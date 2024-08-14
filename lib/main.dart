import 'package:zojatech/res/view_route/route_generator.dart';

import '../../res/import/import.dart';

final navigatorKey = GlobalKey<NavigatorState>();
var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MultiProvider(
        providers: providers,
        child: GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidgetBuilder: (_) {
            //ignored progress for the moment
            return const Center(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(zojatechPrimaryColor),
                ),
              ),
            );
          },
          child: MaterialApp.router(
            builder: (BuildContext context, Widget? widget) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomError(errorDetails: errorDetails);
              };
              return widget!;
            },
            debugShowCheckedModeBanner: false,
            title: StringConstants.appName,
            theme: ThemeHelper.lightTheme,
            routerConfig: RouteGenerator.router,
          ),
        ),
      ),
    );
  }
}
