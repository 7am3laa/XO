import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:xo/HomePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(
              flex: 3,
              child: Center(
                child: AvatarGlow(
                  duration: const Duration(seconds: 2),
                  glowColor: Colors.grey,
                  repeat: true,
                  startDelay: const Duration(seconds: 1),
                  child:Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor:Colors.blueGrey[900],
                      radius: 150,
                        child: const Text('X O',style: TextStyle(color: Colors.grey, fontSize: 60),),
                        ),
                      ),
                    ),
              ) ,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder : (context) => const HomePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(child: Text('Play Game',style: TextStyle(color: Colors.grey, fontSize: 60),)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

