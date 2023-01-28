import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/auth_provider.dart';
import 'package:whackiest_2023/screens/splash.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
            ),
            home: const SplashScreen()),
      ),
    );
  }
}
