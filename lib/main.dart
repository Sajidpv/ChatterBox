import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/features/auth/view_model/provider/login_provider.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'configs/routes/route_names.dart';
import 'configs/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatterBox',
        theme: ThemeData(
          scaffoldBackgroundColor: AppPellet.whiteBackground,
          appBarTheme:
              const AppBarTheme(backgroundColor: AppPellet.whiteBackground),
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
