class Payment {
  double _pay;
  DateTime _dateTime;

  Payment(this._pay, this._dateTime);

  // Factory method to create a Payment object from JSON
  factory Payment.fromJson(Map<String, dynamic> json) {
    // Parse the properties from the JSON map
    double pay = json['pay'] ?? 0.0;
    DateTime dateTime = DateTime.parse(json['dateTime']);

    // Create and return the Payment object
    return Payment(pay, dateTime);
  }

  // Convert Payment object to a JSON representation (Map<String, dynamic>)
  Map<String, dynamic> toJson() {
    return {
      'pay': _pay,
      'dateTime': _dateTime.toIso8601String(),
    };
  }

  DateTime get getDateTime => _dateTime;

  set setDateTime(DateTime value) {
    _dateTime = value;
  }

  double get getPay => _pay;

  set setPay(double value) {
    _pay = value;
  }
}
