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

  // Factory method to create a Project object from JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    // Parse the properties from the JSON map
    String desc = json['desc'];
    DateTime dateTime = DateTime.parse(json['dateTime']);
    double budget = json['budget'] ?? 0.0;
    double remaining = json['remaining'] ?? 0.0;
    List<Payment>? payments = [];
    if (json['payments'] != null) {
      // Parse the payments list from JSON and create Payment objects
      var paymentList = json['payments'] as List;
      payments = paymentList
          .map((paymentJson) {
            return Payment.fromJson(paymentJson);
          })
          .cast<Payment>()
          .toList();
    }

    // Create and return the Project object
    Project project = Project(desc, dateTime, budget);
    project.setPayments = payments;
    project.remaining = remaining;
    return project;
  }

  // Convert Project object to a JSON representation (Map<String, dynamic>)
  Map<String, dynamic> toJson() {
    return {
      'desc': _desc,
      'dateTime': _dateTime.toIso8601String(),
      'budget': _budget,
      'remaining': remaining,
      'payments': _payments.map((payment) => payment.toJson()).toList(),
    };
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
