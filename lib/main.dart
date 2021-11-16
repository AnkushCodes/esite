import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:esite/modules/login/screens/login_screen.dart';
import 'package:esite/modules/splash/ui/splash_screen.dart';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'bloc/user_bloc.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        builder:(context,_)=> Stack(
          children: [
            MaterialApp(
              debugShowCheckedModeBanner: false,
              
              initialRoute: SPLASH_SCREEN,
              onGenerateRoute: RouteGenrator.generateRoute,
            ),
            Align(alignment: Alignment.topCenter,
            child: ConnectionStatusBar(
            color: Colors.red,
            lookUpAddress: 'google.com',
            height: 40.0,
            title: Material(color: Colors.transparent,
            child: Text('Please check connection',
            style: TextStyle(color: Colors.white,fontSize: 15.0),
            ),
            ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
