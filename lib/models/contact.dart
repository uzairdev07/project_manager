class MyContact {
  String _name;
  String _imageUrl;
  double _payment;

  MyContact(this._name, this._imageUrl, this._payment);

  double get getPayment => _payment;

  set setPayment(double value) {
    _payment = value;
  }

  String get getImageUrl => _imageUrl;

  set setImageUrl(String value) {
    _imageUrl = value;
  }

  String get getName => _name;

  set setName(String value) {
    _name = value;
  }
}
