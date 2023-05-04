import 'package:flutter/cupertino.dart';

import 'EventForm.dart';

class EventFormController extends ChangeNotifier {
  String _title;
  String _description ;
  DateTime _start ;
  DateTime _end ;

  EventFormController(
      this._title, this._description, this._start, this._end);

  String get description => _description;
  setDesc(String? description){
    if(description != null) {
      _description = description ;
      notifyListeners() ;
    }
  }



  String get title => _title;
  setTitle(String? title){
    if(title != null) {
      _title = title ;
      notifyListeners() ;
    }
  }

  DateTime get start => _start ;
  setStart(DateTime? start){
    if(start != null){
      _start = start ;
    }
  }


  DateTime get end => _end ;
  setEnd(DateTime? end){
    if(_start != null && end != null) {
      if(end.isBefore(_start)) {
        _end = end;
      }
    }
  }

}