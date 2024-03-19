import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:segundo_parcial/pages/add_event.dart';
import 'package:segundo_parcial/pages/event_list.dart';

//CRISTIAN EULISES SANCHEZ RAMIREZ
//2021-1899
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> widgets = [const EventsList(), const AddEvent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 20,
            padding: const EdgeInsets.all(16),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Registros",
              ),
              GButton(
                icon: Icons.add,
                text: "Agregar",
              ),
            ],
            onTabChange: (i) {
              setState(() {
                _selectedIndex = i;
              });
            },
          ),
        ),
      ),
    );
  }
}
