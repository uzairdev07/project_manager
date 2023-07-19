class Payment {
  double _pay;
  DateTime _dateTime;

  Payment(this._pay, this._dateTime);

  DateTime get getDateTime => _dateTime;

  set setDateTime(DateTime value) {
    _dateTime = value;
  }

  double get getPay => _pay;

  set setPay(double value) {
    _pay = value;
  }
}
