class Customer {
  String _name;
  double _payment;

  Customer(this._name, this._payment);

  double get getPayment => _payment;

  set setPayment(double value) {
    _payment = value;
  }

  String get getName => _name;

  set setName(String value) {
    _name = value;
  }
}
