import 'dart:convert';

import 'package:segundo_parcial/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventController {
  static String key = "events";

  static Future<List<Event>> getEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? data = prefs.getString(key);
    if (data != null) {
      final List<dynamic> events = json.decode(data);
      return events.map((e) => Event.fromJson(e)).toList();
    }

    return [];
  }

  static Future<void> saveEvents(Event event) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Event> data = await getEvents();
    data.add(event);
    await prefs.setString(key, json.encode(data));
  }

  static Future<void> deleteEvent(int i) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Event> events = await getEvents();
    events.removeAt(i);
    await prefs.setString(key, json.encode(events));
  }
}
