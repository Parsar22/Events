//Parsa Rahimiderimi
//04/18/2023
//Event.dart
//EventItem is returned to the list to print each title



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw2/Event_View_Model.dart';
import 'package:provider/provider.dart';
import 'Event.dart';
import 'TableRow.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key}) ;

  _onDelete(int index, EventViewModel eventViewModel ){
    eventViewModel.removeEvent(index) ;
  }

  _onEdit(int index, EventViewModel eventViewModel){
    eventViewModel.ed
  }



  @override
  Widget build(BuildContext context){
    final eventViewModel =context.watch<EventViewModel>();
    final allEvents = eventViewModel.AllEvents ;


    return ListView.builder(

      itemCount: eventViewModel.eventCount,
      itemBuilder: (context, index) => Card(
        child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2.0),
              1: FlexColumnWidth(3.0),
            },
            children: [
              _buildTableRow('title', allEvents[index].title),
              _buildTableRow('Description', allEvents[index].desc),
              _buildTableRow('start', allEvents[index].start.toString()),
              _buildTableRow('title', allEvents[index].end.toString()),
              TableRow(
                  children: [
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  onEdit(event);
                },
                child: const Text('Edit'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    onDelete(event);
                  },
                  child: const Text('Delete'),
                ]
            ),
            ),




    )
  }

  /*
  final Event event;
  final Function(Event) onDelete;
  final Function(Event) onEdit;

  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2.0),
          1: FlexColumnWidth(3.0),
        },
        children: [
          _buildTableRow('Title', event.title),
          _buildTableRow('Start', event.start.toString()),
          _buildTableRow('End', event.end.toString()),
          _buildTableRow('Description', event.desc),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    onEdit(event);
                  },
                  child: const Text('Edit'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    onDelete(event);
                  },
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }*/

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(value),
        ),
      ],
    );
  }
}