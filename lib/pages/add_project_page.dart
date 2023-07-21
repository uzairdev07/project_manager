import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/models/Project.dart';
import 'package:khata_app/models/customer.dart';

class AddProjectPage extends StatefulWidget {
  Customer customer;

  AddProjectPage({super.key, required this.customer});

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  DateTime selectedDate = DateTime.now();
  String _amount = '';
  String _description = '';

  String _formatDate(DateTime date) {
    return DateFormat('d MMM, yyyy').format(date);
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('h:mm a').format(dateTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _amount = text;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter Amount',
                      prefixText: 'RS. ',
                      prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      height: 80.0,
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            _description = text;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Description (Optional)',
                          prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.date_range_outlined),
                      label: Text(
                        _formatDate(selectedDate),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _selectTime(context);
                      },
                      icon: const Icon(Icons.access_time),
                      label: Text(
                        _formatTime(TimeOfDay.fromDateTime(selectedDate)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _amount.isEmpty
                      ? null
                      : () {
                          Project newProject = Project(
                            _description,
                            selectedDate,
                            double.parse(_amount),
                          );
                          widget.customer.addProject(newProject);

                          Navigator.of(context).pop({
                            'customer': widget.customer,
                            'project': newProject
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: _amount.isEmpty ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
