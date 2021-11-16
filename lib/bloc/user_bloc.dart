import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/usermodel.dart';

class UserBloc with ChangeNotifier {
  List<UserModel> userModelList = [];
  int discount = 500;
  int orignal = 1000;
  String menString = 'assets/dashboard/b1.jpeg';
  String womenString = 'assets/dashboard/g1.jpeg';
  List<UserModel> cartModel = [];

  clearDate() {
    cartModel = [];
    notifyListeners();
  }

  addcount(int index) {
    userModelList[index].count = userModelList[index].count + 1;
    notifyListeners();
  }

  removeCount(int index) {
    if (userModelList[index].count > 1) {
      userModelList[index].count = userModelList[index].count - 1;
    }
    notifyListeners();
  }

  addtocart(int index) {
    bool exist = false;
    if (cartModel.isNotEmpty) {
      for (int i = 0; i < cartModel.length; i++) {
        if (cartModel[i].index == userModelList[index].index) {
          exist = true;
        }
      }
    }
    if (!exist) {
    userModelList[index].isSelected=true;
      cartModel.add(userModelList[index]);
    }

    if (cartModel.isEmpty) {
       userModelList[index].isSelected=true;
      cartModel.add(userModelList[index]);
    }

    notifyListeners();
  }

  removeFromcart(int index) {
    int i = cartModel.length;

    for (int j = 0; j < i; j++) {
      if (cartModel[j].index == userModelList[index].index) {
        cartModel.removeAt(j);
      }
    }
     userModelList[index].isSelected=false;
    notifyListeners();
  }

  sortByPriceHighLow() {
    List<UserModel> holdeData = [];
    userModelList = [];
    hydraeteData();
    userModelList.sort((a, b) => int.parse(a.discountPrice)
        .compareTo(int.fromEnvironment(b.discountPrice)));

    userModelList.reversed;
    notifyListeners();
  }

  sortByPriceLowHigh() {
    userModelList = [];
    hydraeteData();
    userModelList.sort((a, b) => a.discountPrice.compareTo(b.discountPrice));
    notifyListeners();
  }

  sortByMen() {
    userModelList = [];
    hydraeteData();
    userModelList.removeWhere((item) => item.ismale == false);
    notifyListeners();
  }

  sortByWoMen() {
    userModelList = [];
    hydraeteData();
    userModelList.removeWhere((item) => item.ismale == true);
    notifyListeners();
  }

  gettotalprice() {
    String price = '0';
    if (cartModel.isEmpty) {
      price = '0';
    } else {
      int i = cartModel.length;
      int value = 0;
      for (int j = 0; j < i; j++) {
        value = int.parse(cartModel[j].discountPrice) + value;
      }
      price = '$value';
    }
    return price;
  }

  gettotalpricewithShipping() {
    String price = '0';
    if (cartModel.isEmpty) {
      price = '0';
    } else {
      int i = cartModel.length;
      int value = 0;
      for (int j = 0; j < i; j++) {
        value = int.parse(cartModel[j].discountPrice) + value;
      }
      price = '$value+1000';
    }
    return price;
  }

  hydraeteData() {
    int j = userModelList.length;
    if (j == 0) {
      userModelList.add(UserModel(
          discountPrice: '${discount + j}',
          image: (menString),
          index: j,
          orignalPrice: '${orignal + j}',
          ismale: true));
    }
    j = userModelList.length;
    for (int i = j; i < j + 8; i++) {
      userModelList.add(UserModel(
          discountPrice: '${discount + i}',
          image: (i % 2 == 0) ? menString : womenString,
          index: i,
          orignalPrice: '${orignal + i}',
          ismale: i % 2 == 0));
    }
    print(userModelList.length);
  }

  addData() {
    int j = userModelList.length;
    if (j == 0) {
      userModelList.add(UserModel(
          discountPrice: '${discount + j}',
          image: (menString),
          index: j,
          orignalPrice: '${orignal + j}',
          ismale: true));
    }
    j = userModelList.length;
    for (int i = j; i < j + 8; i++) {
      userModelList.add(UserModel(
          discountPrice: '${discount + i}',
          image: (i % 2 == 0) ? menString : womenString,
          index: i,
          orignalPrice: '${orignal + i}',
          ismale: i % 2 == 0));
    }
    notifyListeners();
    print(userModelList.length);
  }
}
