class Reserve {
  int id;
  final String _description;
  final String _urlName;
  final double _price;
  final DateTime _date;

  Reserve(this.id, this._price, this._description, this._date, this._urlName);

  String get description => _description;
  String get urlName => _urlName;
  double get price => _price;
  DateTime get date => _date;
}