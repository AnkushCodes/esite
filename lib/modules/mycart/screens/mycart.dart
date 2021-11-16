import 'package:esite/bloc/user_bloc.dart';
import 'package:esite/modules/mycart/components/component_card.dart';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/src/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  dialogCall() {
    Dialogs.materialDialog(
        barrierDismissible: false,
        color: Colors.white,
        msg: 'Order is Placed Loading ...',
        title: 'Shopping',
        context: context,
        actions: [
          // IconsButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   text: 'Ok',
          //   iconData: Icons.done,
          //   color: Colors.blue,
          //   textStyle: TextStyle(color: Colors.white),
          //   iconColor: Colors.white,
          // ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Cart'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                ...context
                    .read<UserBloc>()
                    .cartModel
                    .map((e) => ComponetOfCard(
                          userModel: e,
                        ))
                    .toList(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '- - - - - - - - - - - - - - - - - - - ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'SUBTOTAL',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      'Rs. ${context.read<UserBloc>().gettotalprice()}',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'SHIPPING',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      'Rs. ${context.read<UserBloc>().gettotalpricewithShipping()}',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 5,
              bottom: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(5),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 12, letterSpacing: 1.2)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 15)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      onPressed: context.read<UserBloc>().cartModel.isEmpty
                          ? null
                          : () async {
                              await dialogCall();
                              await Future.delayed(Duration(seconds: 5));
                              context.read<UserBloc>().clearDate();
                              Navigator.pushNamedAndRemoveUntil(
                                  context, DASHBOARD_SCREEN, (route) => false);
                              setState(() {});
                              print('Ok');
                            },
                      child: Text(
                        'CHECKOUT',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
