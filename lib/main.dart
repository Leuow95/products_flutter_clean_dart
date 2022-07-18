import 'package:flutter/material.dart';

//importas as dependencias quando trabalhar no presenter
import 'package:firebase_core/firebase_core.dart';
import 'package:products_challenge/features/home/presenter/controllers/pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/homepage",
      routes: {
        "/homepage": (context) => const HomePage(),
      },
    );
  }
}
