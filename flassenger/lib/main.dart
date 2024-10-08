import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flassenger/screens/chat_screen.dart';
import 'package:flassenger/screens/loading_screen.dart';
import 'package:flassenger/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA4iTGZ6jwVyyyF1JPV44npASWOTjAymHU',
      appId: '1:841986336105:android:fa6cf8e042f40c140809f8',
      messagingSenderId: '841986336105',
      projectId: 'flassenger-2d861',
    ),
  );

  runApp(Flassenger());
}

class Flassenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light().copyWith(
      //   textTheme: TextTheme(
      //     bodyLarge: TextStyle(
      //       color: Colors.black54,
      //     ),
      //   ),
      // ),
      initialRoute: LoadingScreen.id,
      // routes: {
      //   // 'welcome_screen': (context) => WelcomeScreen,
      //   LoadingScreen.id: (context) => LoadingScreen(),
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      //   ChatScreen.id: (context) => ChatScreen(),
      // },

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ChatScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Some error is occured'),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }

          return WelcomeScreen();
        },
      ),
    );
  }
}
