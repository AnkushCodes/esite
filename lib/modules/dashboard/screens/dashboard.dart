import 'package:badges/badges.dart';
import 'package:esite/bloc/user_bloc.dart';
import 'package:esite/modules/dashboard/components/card_show.dart';
import 'package:esite/route_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/src/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late ScrollController _controller;
  bool isLoading = false;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      print(_controller.position.extentAfter);
      if (_controller.position.extentAfter == 0) {
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 6), () {
          isLoading = false;
          context.read<UserBloc>().addData();
        });
      }
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    context.read<UserBloc>().hydraeteData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.arrow_upward),
                title: Text('Price High to Low'),
                onTap: () {
                  context.read<UserBloc>().sortByPriceHighLow();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.arrow_downward),
                title: Text('Price Low to High'),
                onTap: () {
                  context.read<UserBloc>().sortByPriceLowHigh();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Only Men'),
                onTap: () {
                  context.read<UserBloc>().sortByMen();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.pregnant_woman_outlined),
                title: new Text('Only Women'),
                onTap: () {
                  context.read<UserBloc>().sortByWoMen();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<UserBloc>().cartModel.length;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('Dashboard'),
            actions: [
              Badge(
                  badgeContent: Text(
                    '${context.watch<UserBloc>().cartModel.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          padding: EdgeInsets.only(top: 10),
                          onPressed: () {
                            Navigator.pushNamed(context, MY_CART_SCREEN);
                          },
                          icon: Icon(Icons.shopping_cart)),
                    ],
                  )),
              SizedBox(
                width: 20,
              )
            ],
            centerTitle: true),
        body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: Stack(
            children: [
              StaggeredGridView.countBuilder(
                controller: _controller,
                crossAxisCount: 4,
                itemCount: context.watch<UserBloc>().userModelList.length,
                itemBuilder: (BuildContext context, int index) =>
                    CardShow(index: index),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2.2 : 2.2),
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 4.0,
              ),
              Visibility(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.25),
                    child: Center(
                      child: SpinKitDoubleBounce(color: Colors.orangeAccent),
                    ),
                  ),
                  visible: isLoading),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            bottomSheet();
          },
          child: Icon(Icons.filter_list),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }
}
