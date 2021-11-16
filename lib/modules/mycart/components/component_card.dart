import 'package:esite/bloc/models/usermodel.dart';
import 'package:esite/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ComponetOfCard extends StatefulWidget {
  final UserModel userModel;
  const ComponetOfCard({Key? key, required this.userModel}) : super(key: key);

  @override
  _ComponetOfCardState createState() => _ComponetOfCardState();
}

class _ComponetOfCardState extends State<ComponetOfCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        leading: Container(
          height: 80,
          width: 80,
          child: Image.asset(
            '${widget.userModel.image}',
            fit: BoxFit.contain,
          ),
        ),
        title: Text('Jacket'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: 5,
            // ),
            Text(
              'Rs. ${widget.userModel.discountPrice} x ${widget.userModel.count}',
            ),
            SizedBox(
              width: 100,
            ),
            Text('Rs ${widget.userModel.orignalPrice}',
                style: TextStyle(decoration: TextDecoration.lineThrough))
          ],
        ),
        trailing: InkWell(
          onTap: () {
          int j=  context.read<UserBloc>().cartModel.length;
            for(int i=0;i<j;i++){
             if(context.read<UserBloc>().cartModel[i].index==widget.userModel.index){
context.read<UserBloc>().removeFromcart(i);
              }
            }
          },
          child: Icon(Icons.cancel),
        ),
      ),
    );
  }
}
