import 'package:esite/bloc/user_bloc.dart';
import 'package:esite/modules/detailview/screens/detail_view.dart';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CardShow extends StatefulWidget {
  final index;
  const CardShow({this.index});

  @override
  _CardShowState createState() => _CardShowState();
}

class _CardShowState extends State<CardShow> {
  Color color = Colors.white;
  bool isFaourate = false;

  @override
  Widget build(BuildContext context) {
    isFaourate =context.read<UserBloc>().userModelList[widget.index].isSelected;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DETAIL_VIEW_SCREEN,
            arguments: widget.index);
      },
      child: Card(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 10,
                    child: Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.black38,
                            Colors.black45
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.8, 1],
                        ),
                      ),
                      child: Image.asset(
                        '${context.read<UserBloc>().userModelList.isEmpty ? '0' : context.watch<UserBloc>().userModelList[widget.index].image}',
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5.2,
                      ),
                      Text(
                        'Jacket',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Rs. ${context.read<UserBloc>().userModelList[widget.index].discountPrice}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              'Rs ${context.read<UserBloc>().userModelList[widget.index].orignalPrice}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white24, shape: BoxShape.circle),
                        child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              isFaourate = !isFaourate;
                              if (isFaourate) {
                                context
                                    .read<UserBloc>()
                                    .addtocart(widget.index);
                              } else {
                                context
                                    .read<UserBloc>()
                                    .removeFromcart(widget.index);
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 18,
                              color: isFaourate ? Colors.red : Colors.white,
                            ))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
