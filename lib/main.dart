import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'package:fooderlich/navigation/app_navigation.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/models/models.dart';

void main() {
  final state = AppStateManager();
  runApp(FooderLich(
    appStateManager: state,
  ));
  state.initialize();
}

class FooderLich extends StatelessWidget {
  final AppStateManager appStateManager;

  const FooderLich({Key? key, required this.appStateManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateManager>(
          create: (context) => appStateManager,
        ),
        Provider<AppNavigation>(
          create: (context) => AppNavigation(appStateManager),
        ),
        ChangeNotifierProvider<GroceryItemManager>(
          create: (context) => GroceryItemManager(),
        ),
      ],
      child: Consumer<AppStateManager>(
        builder: (context, manager, child) {
          final ThemeData theme;

          manager.darkMode
              ? theme = FooderLichTheme.dark()
              : theme = FooderLichTheme.light();

          return Builder(
            builder: (context) {
              final router =
                  Provider.of<AppNavigation>(context, listen: false).router;

              return MaterialApp.router(
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
                routerDelegate: router.routerDelegate,
                debugShowCheckedModeBanner: false,
                theme: theme,
                title: 'fooderlich',
              );
            },
          );
        },
      ),
    );
  }
}
