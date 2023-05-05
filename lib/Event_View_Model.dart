import 'package:flutter/cupertino.dart';
import 'package:hw2/EditEventForm.dart';
import 'package:hw2/Event_Items.dart';
import 'Event.dart';


class EventViewModel extends ChangeNotifier {
  final List<Event> _events = [] ;

  void addEvent(Event event) {
    _events.add(event);
    // call this after making any modifications to the model
    notifyListeners();
  }
  
  void removeEvent(int index) {
    _events.removeAt(index) ;
    notifyListeners() ;
  }

/*  void editEvent(int index){
    EditEvent(index, _events) ;
    notifyListeners() ;
  }*/


  int get eventCount => _events.length;


  List<Event> get AllEvents => _events ;

}