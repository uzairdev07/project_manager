import 'package:khata_app/models/Payment.dart';

class Project {
  String _desc;
  DateTime _dateTime;
  double _budget;
  List<Payment> _payments = [];
  double remaining = 0;

  Project(this._desc, this._dateTime, this._budget) {
    remaining = _budget;
    _payments = [];
  }

  double getReceived() {
    double result = 0;
    for (Payment payment in _payments) {
      result += payment.getPay;
    }
    return result;
  }

  void addPayment(Payment payment) {
    _payments.add(payment);
    remaining -= payment.getPay;
  }

  List<Payment> get getPayments => _payments;

  set setPayments(List<Payment> value) {
    _payments = value;
  }

  double get getBudget => _budget;

  set setBudget(double value) {
    _budget = value;
  }

  DateTime get getDateTime => _dateTime;

  set setDateTime(DateTime value) {
    _dateTime = value;
  }

  String get getDesc => _desc;

  set setDesc(String value) {
    _desc = value;
  }
}
