import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

void main() async {
  BlocOverrides.runZoned(
        () => runApp(DroApp(
      shoppingRepository: ShoppingRepository(),
    )),
    blocObserver: SimpleBlocObserver(),
  );
}

class DroApp extends StatelessWidget {
  const DroApp({
    Key? key,
    required this.shoppingRepository,
  }) : super(key: key);

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        title: kAppName,
        theme: AppTheme(context).lightTheme,
        initialRoute: Routes.navScreen,
        routes: Routes().generateRoutes(context),
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: kPurple,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: kTransparent,
            systemNavigationBarIconBrightness: Theme.of(context).brightness,
          ));
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context),
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
