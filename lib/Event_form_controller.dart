import 'package:flutter/cupertino.dart';
import 'package:hw2/WrongDate.dart';

import 'EventForm.dart';

class EventFormController extends ChangeNotifier {
  String _title;
  String _description ;
  DateTime? _start ;
  DateTime? _end ;

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

  DateTime? get start => _start ;
  setStart(DateTime? start,BuildContext context){
    if(start != null){
      if(_end == null) {
        _start = start;
        notifyListeners() ;
      }
      else if (_end != null){
        if(_start!.isBefore(_end!)){
          _start = start ;
          notifyListeners() ;
        }
        else if (_start!.isAfter(_end!)){
          WrongStartDate().showSnackBar(context);
        }
      }
    }
  }


  DateTime? get end => _end ;
  setEnd(DateTime? end, BuildContext context){
    if(_start != null && end != null) {
      if(end.isAfter(_start!)) {
        _end = end;
        notifyListeners() ;
      }
      else {
        WrongEndDate().showSnackBar(context) ;
      }
    }
    else{
      WrongEndDate().showSnackBar(context) ;
    }
  }

}