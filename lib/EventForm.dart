//Parsa Rahimiderimi
//04/18/2023
//EventForm.dart
// the page to open a form to add events to the list

import 'package:flutter/cupertino.dart';
import 'package:hw2/Event.dart';
import 'package:flutter/material.dart';
import 'package:hw2/Event_View_Model.dart';



class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}



class _EventScreenState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController(text: null);
  final _descController = TextEditingController(text: null);

  /*// _onWrongDate is needed to be able to initiate wrongDate()
  _onWrongDate() {
    WrongDate().showSnackBar(context);
  }*/

  String title = 'title here';

  String desc = 'desc here';

  late DateTime _startDateTime;
  late DateTime _endDateTime;

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title cannot be empty';
    }

    return null;
  }


  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description cannot be empty';
    }
    return null;
  }


  _onDateAdded(DateTime newDate) {
    if (newDate != null) {
      setState(() {
        _startDateTime = newDate;
      });
    }
  }

  _onEndDateAdd(DateTime newDate) {
    if (newDate != null) {
      if (_startDateTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: const [
                Icon(Icons.error),
                SizedBox(width: 20),
                Expanded(
                  child: Text('Invalid end date was given!'),
                )
              ],
            ),
          ),
        );
      }

      else if (newDate.isBefore(_startDateTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: const [
                Icon(Icons.error),
                SizedBox(width: 20),
                Expanded(
                  child: Text('Invalid end date was given!'),
                )
              ],
            ),
          ),
        );
      }
      else {
        setState(() {
          _endDateTime = newDate;
        });
      }
    }
  }


  _submit() {
    if (_formKey.currentState!.validate()) {
      final event = Event(
          _titleController.text,
          _descController.text,
          _startDateTime,
          _endDateTime
      );
      final EventViewModel = context.read<EventViewModel>();

      _formKey.currentState!.reset();
      Navigator.pop(context, event);
    }
  }


  @override
  Widget build(BuildContext context) {


    //creating the form to add an event
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
//              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(labelText: 'title'),
                    keyboardType: TextInputType.text,
                    controller: _titleController,
                    validator: _validateTitle),

                TextFormField(
                    decoration: const InputDecoration(labelText: 'desc'),
                    validator: _validateDescription,
                    keyboardType: TextInputType.text,
                    controller: _descController
                ),

                ElevatedButton(
                  child: Text('Select Start Date'),


                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),

                    );
                    _onDateAdded(newDate!);
                  },),

                ElevatedButton(
                  child: Text('Select End Date'),

                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),

                    );
                    _onEndDateAdd(newDate!);
                  },

                ),
                ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Add Event')
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('back')

                ),


              ]
          ),
        ),
      ),
    );
  }

}
