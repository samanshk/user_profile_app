import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:login_signup/HomePage.dart';
import 'package:login_signup/Signup.dart';
import 'package:login_signup/Splash.dart';
import 'Login.dart';
import 'Profile.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//    bool dark  = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         // '/': (context) => HomePage(),
//         '/Login': (context) => Login(),
//         // '/Profile': (context) => Profile(),
//         '/Signup': (context) => Signup()
//       },
//       title: 'Login Signup app',
//       theme: dark ? ThemeData.dark() : ThemeData.light(), 
//       home: HomePage(dark),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            // '/': (context) => HomePage(),
            '/Login': (context) => Login(),
            // '/Profile': (context) => Profile(),
            '/Signup': (context) => Signup()
          },
          title: 'Flutter Demo',
          theme: theme,
          home: Splash(),
        );
      }
    );
  }
}
