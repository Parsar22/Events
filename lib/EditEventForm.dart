//Parsa Rahimiderimi
//04/18/2023
//EditEventForm.dart
// the page to open a form to edit an events dates

import 'package:flutter/material.dart';
import 'package:hw2/Event.dart';


class EditEventForm extends StatefulWidget {
  final Event? event;

  const EditEventForm({Key? key, this.event}) : super(key: key);

  @override
  _EventFormState createState() => _EventFormState();
}

//screening the state
class _EventFormState extends State<EditEventForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;



  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      _startDate = widget.event!.start;
      _endDate = widget.event!.end;
    }
  }

  _onDateAdded(newDate){
    if(newDate != null){
     _startDate = newDate ;
     }
  }

  _onEndDateAdded(DateTime newDate) {
    if (newDate != null) {
      if (_startDate == null) {
        return WrongDate().showSnackBar(context) ;
      }
      if (newDate.isBefore(_startDate!)) {
        return WrongDate().showSnackBar(context) ;
      }
      setState(() {
        _endDate= newDate;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final event = Event(widget.event?.title ?? '', widget.event?.desc ?? '', _startDate!, _endDate!);
      Navigator.pop(context, event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event == null ? 'New Event' : 'Edit Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
            ElevatedButton(
           child: Text('Edit Start Date'),

            onPressed: () async {
              DateTime? newDate = await showDatePicker(context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),

              );
              _onDateAdded(newDate!);
            }
              ),

              ElevatedButton(
                  child: Text('Edit End Date'),

                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),

                    );
                    _onEndDateAdded(newDate!);
                  }

              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
