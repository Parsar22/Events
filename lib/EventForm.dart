//Parsa Rahimiderimi
//04/18/2023
//EventForm.dart
// the page to open a form to add events to the list

import 'package:flutter/cupertino.dart';
import 'package:hw2/Event.dart';
import 'package:flutter/material.dart';
import 'package:hw2/Event_View_Model.dart';
import 'package:hw2/Event_form_controller.dart';
import 'package:hw2/WrongDate.dart';
import 'package:hw2/event_form_fields.dart';
import 'package:provider/provider.dart';
import 'Event_Items.dart';
import 'Event_View_Model.dart';


class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventScreenState();
}



class _EventScreenState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController(text: null);
  final _descController = TextEditingController(text: null);
  final _EventFormController = EventFormController(
      '', '', null, null);

  /*// _onWrongDate is needed to be able to initiate wrongDate()
  _onWrongDate() {
    WrongDate().showSnackBar(context);
  }*/

  String title = 'title here';

  String desc = 'desc here';

  late DateTime _startDateTime;
  late DateTime _endDateTime;


  _submit() {
    if(_EventFormController.start == null || _EventFormController.end == null ||  _descController.text.isEmpty || _titleController.text.isEmpty){
      EmptyFields().showSnackBar(context) ;
    }
    if (_formKey.currentState!.validate()) {
      final event = Event(
          _titleController.text,
          _descController.text,
          _EventFormController.start!,
          _EventFormController.end!
      );
      final eventViewModel = context.read<EventViewModel>();
      eventViewModel.addEvent(event);

      _formKey.currentState!.reset();
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _EventFormController,
        builder: (context, _) =>
            Form(
                key: _formKey,
                child: event_form_fields(
                  titleController: _titleController,
                  descController: _descController,
                  eventFormController: _EventFormController,
                  submit: _submit,)
            )
    );
  }
}


    //creating the form to add an event
   /* return Scaffold(
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
                    validator: _validateTitle
                ),

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

}*/
