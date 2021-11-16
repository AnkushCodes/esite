import 'dart:ui';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Image image;
  late Size size;
  double sheight = 100.0;
  double swidth = 100.0;
  @override
  void initState() {
    image = Image.asset('assets/bg.jpg');
    Future.delayed(Duration(seconds: 2), () {
      sheight = 500;
      swidth = 600;
      setState(() {});
    });
    Future.delayed(Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, LOGIN);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 2.8,
                      width: size.width / 1,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new ExactAssetImage('assets/bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: new BackdropFilter(
                          filter: new ImageFilter.blur(
                              sigmaX: 600.0, sigmaY: 1000.0)),
                    ),
                  ],
                ),
                Positioned(
                  left: size.width / 2.2,
                  bottom: 60,
                  child: SpinKitDoubleBounce(color: Colors.blueAccent),
                ),
                Positioned(
                  left: size.width / 2.6,
                  bottom: 20,
                  child: Text(
                    'Loading..',
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            )));
  }
}
