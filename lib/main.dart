//Parsa Rahimiderimi
//04/18/2023
//main.dart


import 'package:flutter/material.dart' ;
import 'package:hw2/TitlesPage.dart';
import 'Event.dart';
import 'EventItem.dart';
import 'EditEventForm.dart';
import 'EventForm.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'Event_View_Model.dart';

void main() {
  runApp(MyApp());
}



final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, _) => const MyHomePage(),
    ),

    GoRoute(
        path: '/Edit',
        name: 'EditForm',
        builder: (context, _) => const EditEventForm(),
    ),
  ],
);



class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => EventViewModel(),
  // We use this alternate constructor to provide a router instead of
  // the default constructor that only takes a single "home" page.
      child: MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
        routerConfig: router,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  }


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text("Event list"),
        centerTitle: true,
    ),
      body: const Center(
          child: EventForm()
      ),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EventViewModel(),
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.brown,
            ),
            home: const MyEventsApp(title: "Parsa's")
        )
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Events App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyEventsApp(),
    );
  }
}



class MyEventsApp extends StatefulWidget {
  const MyEventsApp({super.key, required this.title});
  final String title ;

  @override
  _HomePageState createState() => _HomePageState() ;
}

//creating the homepage widget
class _HomePageState extends State<MyEventsApp> {

  bool _showAllEvents = true; //to show all events or now
  final List<Event> _events = [];

  void _addEvent(Event event) {
    setState(() {
      _events.add(event);
    });
  }


  void _deleteEvent(Event event) {
    setState(() {
      _events.remove(event);
    });
  }


  void _toggleShowAllEvents() {
    setState(() {
      _showAllEvents = !_showAllEvents;
    });
  }

  void _editEvent(Event event) async {
    final updatedEvent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditEventForm(event: event)),
    );
    if (updatedEvent != null) {
      setState(() {
        final index = _events.indexOf(event);
        _events[index] = updatedEvent;
      });
    }
  }




  @override
  Widget build(BuildContext context) {

    List<Event> liveEvents = _events.where((ev) =>
        ev.end.compareTo(DateTime.now()) > 0).toList(); // if the event is not passed
    List<Event> eventsToShow = _showAllEvents ? _events : liveEvents ;

    return Scaffold(
        appBar: AppBar(
          title: Text('Event Manager'),
        ),


        body: ListView.builder(
          itemCount: eventsToShow.length,
          itemBuilder: (context, index) {
            return EventItem(
              event: eventsToShow[index],
              onDelete:(event){
                _deleteEvent(event) ;
              },
              onEdit: (event){
                _editEvent(event) ;

            },
            );
          },
        ),


        //Adding events to the app using EventForm
        floatingActionButton: FloatingActionButton(

          onPressed: () async {
            final newEvent = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventForm()), //Event form is introduces in EventForm.dart
            );

            if (newEvent != null) {
              _addEvent(newEvent);
            }
          },
          tooltip: 'Add Event',

          child: Icon(Icons.add),

        ),


        //Bottom bar
        bottomNavigationBar: BottomAppBar(
          child: Row(
            //if we want to add more space later:
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //add a button to give the user ability to choose what events they want to see
              IconButton(
                icon: Icon(_showAllEvents ? Icons.check_box : Icons.check_box_outline_blank),
                onPressed: _toggleShowAllEvents,
              ),
              const Text('Passed Events?')

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}*/



