
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw2/Event_form_controller.dart';
import 'package:hw2/Event_View_Model.dart';

import 'Event.dart';

String? _validateTitle(String? title){
  if(title == null || title.isEmpty)
  {
    return "please fill in a title." ;

  }
}

String? _validateDesc(String? desc){
  if(desc == null || desc.isEmpty)
  {
    return "please fill in a description." ;

  }
}



class event_form_fields extends StatelessWidget{

  final TextEditingController _titleController ;
  final TextEditingController _descController ;
  final EventFormController _eventFormController;
  final void Function() _submit ;

  const event_form_fields({
  required TextEditingController titleController,
  required TextEditingController descController,
  required EventFormController eventFormController,
  required void Function() submit,}
      ) :_titleController = titleController, _descController = descController, _eventFormController = eventFormController, _submit = submit ;

  @override
  Widget build(BuildContext context) {


    //creating the form to add an event
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(labelText: 'title'),
                    keyboardType: TextInputType.text,
                    controller: _titleController,
                    validator: _validateTitle),

                TextFormField(
                    decoration: const InputDecoration(labelText: 'desc'),
                    validator: _validateDesc,
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
                    _eventFormController.setStart(newDate, context);
                  },

                ),

                ElevatedButton(
                  child: Text('Select End Date'),

                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),

                    );
                    _eventFormController.setEnd(newDate, context) ;
                  },

                ),
                ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Add Event')
                ),

                /*ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('back')

                ),*/


              ]
          ),
        ),
      );
  }

}