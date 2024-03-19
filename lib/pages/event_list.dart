import 'package:flutter/material.dart';
import 'package:segundo_parcial/controller/event_controller.dart';
import 'package:segundo_parcial/model/model.dart';
import 'package:segundo_parcial/pages/event_details.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventListState();
}

class _EventListState extends State<EventsList> {
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    List<Event> allEvents = await EventController.getEvents();
    setState(() {
      events = allEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      EventController.getEvents().then((allEvents) {
        events.clear();
        for (var event in allEvents) {
          events.add(event);
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Lista de Eventos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, i) {
          final event = events[i];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              title: Text(event.title),
              subtitle: Text(event.date),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetails(event: event)))
              },
            ),
          );
        },
      ),
    );
  }
}
