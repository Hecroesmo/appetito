class FoodPlate {
  late int _id;
  final String _name;
  final String _description;
  final double _price;
  final String _imageUrl;

  //  Constructor
  FoodPlate(
      this._name,
      this._description,
      this._price,
      this._id,
      this._imageUrl
      );

  //  Getters
  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;
  String get imageUrl => _imageUrl;

  //  Setters
  set id(int id) => _id = id;
}