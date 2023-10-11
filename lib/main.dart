import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutix013/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // foreground
              ),
              onPressed: () async {
                // await AutServices.signUp("antonprafanto@gmail.com", "1234125",
                await AutServices.signUp("bram@gmail.com", "1234125", "mr Bram",
                    ["Action", "Horror", "Sci-Fi", "Drama"], "English");
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromARGB(255, 52, 123, 255), // foreground
              ),
              onPressed: () async {
                await AutServices.signIn("baadur@gmail.com", "1234125");
              },
              child: const Text('Sign In'),
            )
          ],
        ),
      )),
    );
  }
}
