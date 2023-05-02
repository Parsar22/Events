import 'package:flutter/cupertino.dart';
import 'package:hw2/EditEventForm.dart';
import 'package:hw2/EventItem.dart';
import 'Event.dart';

class EventViewModel extends ChangeNotifier{
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

  void ed

  int get eventCount => _events.length;


  List<Event> get AllEvents => _events ;

}