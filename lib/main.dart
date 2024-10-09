import 'package:app_8/firebase_options.dart';
import 'package:app_8/views/feed_page.dart';
import 'package:app_8/views/login_page.dart';
import 'package:app_8/views/register_page.dart';
import 'package:app_8/views/home_page.dart';
import 'package:app_8/views/details_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/feed': (context) => FeedPage(),
        '/details': (context) => DetailPage(user: ModalRoute.of(context)!.settings.arguments as Map),
      },
    );
  }
}