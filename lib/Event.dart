//Parsa Rahimiderimi
//04/18/2023
//Event.dart
// Event class

class Event {
  final String _title;

  final String _description;

  final DateTime _startDate;
  final DateTime _endDate;

  const Event(this._title, this._description, this._startDate, this._endDate);

  String get title => _title ;

  String get desc => _description ;

  DateTime get start => _startDate;

  DateTime get end => _endDate;
}
