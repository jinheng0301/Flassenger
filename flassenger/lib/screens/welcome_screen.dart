import 'package:flassenger/widgets/rounded_button.dart';
import 'package:flassenger/screens/login_screen.dart';
import 'package:flassenger/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; //controller name
  late Animation animation1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
      // upperBound: 200.0,
    );

    animation1 = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    );

    controller.forward();

    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (controller.isAnimating) {
      controller.stop(); // Stop the animation if it's still running.
    }
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/messenger.png'),
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // AnimatedTextKit(
                //   animatedTexts: [
                //     TyperAnimatedText(
                //       'Flassenger',
                //       textStyle: const TextStyle(
                //         fontSize: 45.0,
                //         fontFamily: 'Pacifico',
                //         fontWeight: FontWeight.w300,
                //       ),
                //     ),
                //   ],
                // ),
                Text(
                  'Flassenger',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'A messaging app takes name from Flash and Messenger',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log in',
              color: Colors.blueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                //Go to register screen.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => RegistrationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
