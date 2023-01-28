
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/achivement_provider.dart';
import 'package:whackiest_2023/provider/allusers_provider.dart';
import 'package:whackiest_2023/provider/auth_provider.dart';
import 'package:whackiest_2023/provider/clubProvider.dart';
import 'package:whackiest_2023/provider/committe_provider.dart';
import 'package:whackiest_2023/provider/event_providr.dart';
import 'package:whackiest_2023/provider/register_provider.dart';
import 'package:whackiest_2023/screens/about_first.dart';
import 'package:whackiest_2023/screens/main_class.dart';
import 'package:whackiest_2023/screens/splash.dart';


class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RegisterProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (ctx) => UserProvider(),
          update: (ctx,auth,_) => UserProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, clubProvider>(
          create: (ctx) => clubProvider(),
          update: (ctx,auth,_) => clubProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, EventProvider>(
          create: (ctx) => EventProvider(),
          update: (ctx,auth,_) => EventProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, AchievementProvider>(
          create: (ctx) => AchievementProvider(),
          update: (ctx,auth,_) => AchievementProvider(),
        ),

        ChangeNotifierProxyProvider<AuthProvider, CommitteeProvider>(
          create: (ctx) => CommitteeProvider(),
          update: (ctx,auth,_) => CommitteeProvider(),
        ),

        ChangeNotifierProxyProvider<AuthProvider, EventProvider>(
          create: (ctx) => EventProvider(),
          update: (ctx,auth,_) => EventProvider(),
        ),



        ChangeNotifierProxyProvider<AuthProvider, RegisterProvider>(
          create: (ctx) => RegisterProvider(),
          update: (ctx,auth,_) => RegisterProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              brightness: Brightness.light,
              fontFamily: 'medium',
            ),
            home: auth.isAuth
                ? const MainScreen()
                : FutureBuilder(
                  //  future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting ? const SplashScreen() : const About(),
                  ),
            //routes: {
          //               Login.routeName:(context)=>Login(),
          //             About.routeName: (context) => const About(),
          //
          //             }
           ),
      ),
    );
  }
}
