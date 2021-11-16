import 'package:esite/modules/login/components/pass_text_widget.dart';
import 'package:esite/modules/login/components/text_widget.dart';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userController;
  late TextEditingController passUserController;
  late Size size;
  final key = GlobalKey<FormState>();
  late AutovalidateMode autovalidateMode;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passUserController = TextEditingController();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: key,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: new ExactAssetImage('assets/gredient.jpg'),
              fit: BoxFit.cover,
            )),
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                    top: size.height / 5,
                    left: size.width / 3.9,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 40, color: Colors.white10),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 1.6,
                    width: size.width / 1.1,
                    child: Card(
                      elevation: 10,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height / 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height / 18,
                          ),
                          Container(
                            width: size.width / 1.2,
                            child: TextWidget(
                              hint: 'User ID',
                              textFieldController: userController,
                              icon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width / 1.2,
                            child: PassTextWidget(
                                textFieldController: passUserController,
                                hint: 'Pasword'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(5),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                              TextStyle(
                                                  fontSize: 12,
                                                  letterSpacing: 1.2)),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 15)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ))),
                                  onPressed: () async {
                                    if (key.currentState!.validate()) {
                                      isLoading = true;
                                      setState(() {});
                                      await Future.delayed(
                                          Duration(seconds: 5));
                                      isLoading = false;
                                      Navigator.popAndPushNamed(
                                          context, DASHBOARD_SCREEN);
                                    } else {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    }

                                    setState(() {});
                                  },
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                    child: Container(
                      height: size.height,
                      color: Colors.black.withOpacity(0.25),
                      child: Center(
                        child: SpinKitCubeGrid(color: Colors.orangeAccent),
                      ),
                    ),
                    visible: isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
