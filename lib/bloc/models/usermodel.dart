class UserModel {
  String type;
  int index;
  String image;
  String orignalPrice;
  String discountPrice;
  bool ismale;
  bool isSelected;
  int count;
  UserModel(
      {this.type = 'T shirt',
      this.count = 1,
      this.isSelected = false,
      required this.index,
      required this.image,
      required this.orignalPrice,
      required this.discountPrice,
      this.ismale = true});
}
