import 'package:flassenger/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation1;
  late Animation animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animation1 = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(controller);

    animation2 = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    controller.forward();

    controller.addListener(
      () {
        setState(() {});
      },
    );

    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          // Animation has completed, navigate to WelcomeScreen
          Navigator.pushReplacementNamed(context, WelcomeScreen.id);
        }
      },
    );
    // When the animation is completed, it will navigate to the WelcomeScreen.
    // This ensures that the navigation occurs after the animation is finished.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation1.value,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: const Hero(
                tag: 'logo',
                child: Image(
                  image: AssetImage('images/messenger.png'),
                  // height: animation2.value * 80,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'from',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 40,
                      ),
                      Text(
                        'Meta',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
