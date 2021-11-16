import 'dart:ui';

import 'package:esite/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DetailView extends StatefulWidget {
  final int index;
  const DetailView({required this.index});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height / 1.2,
              width: size.width / 1.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/dashboard/b1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 600.0, sigmaY: 1000.0)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height / 4.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(50, 40),
                        topRight: Radius.elliptical(50, 40))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Rs. ${context.read<UserBloc>().userModelList[widget.index].discountPrice}',
                          style: TextStyle(fontSize: 25),
                        ),
                        Spacer(),
                        Text(
                          'Rs ${context.read<UserBloc>().userModelList[widget.index].orignalPrice}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black12),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    context
                                        .read<UserBloc>()
                                        .removeCount(widget.index);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white),
                                child: Text(
                                  '${context.watch<UserBloc>().userModelList[widget.index].count}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    context
                                        .read<UserBloc>()
                                        .addcount(widget.index);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width / 3,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<UserBloc>().addtocart(widget.index);

                            Navigator.pop(context);
                          },
                          child: Card(
                            color: Color(0xff3641B7),
                            child: Container(
                              height: 100,
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
