import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tezda_assessent_task/config/app_router.dart';
import 'package:tezda_assessent_task/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await DiContainer.setUpDi();
  // FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
  // firebaseAppCheck.activate(
  //   androidProvider: AndroidProvider.debug,
  // );
  // firebaseAppCheck.getToken().then((value) => print("APP CHECK: $value"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
        ),
        shadowColor: Colors.blue, // Set the primary color to blue
        indicatorColor: Colors.orange,
        scaffoldBackgroundColor:
            Colors.white, // Set the background color to white
        dividerColor: Colors.orange,
        dividerTheme: const DividerThemeData(
          space: 0,
          color: Colors.grey,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 4,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
