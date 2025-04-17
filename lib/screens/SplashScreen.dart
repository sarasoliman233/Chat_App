import 'package:chat_app/screens/LoginScreen.dart';
import 'package:chat_app/screens/SignUpScreen.dart';
import 'package:chat_app/widgets/appText.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {

  late AnimationController _controller;
  late Animation<double> _animation;

  void initState(){
    super.initState();

    _controller =AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0); // يبدأ من خارج الشاشة على اليمين
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 62,height: 72,),
            SizedBox(height: 10,),
            appText(text: 'Chatbox', fontSize: 40, color: Color(0xFF001815), fontFamily: 'circular',fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,)

          ],
        ),
      ),
    );
  }
}
