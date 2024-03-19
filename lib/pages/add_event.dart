import 'package:flutter/material.dart';
import 'package:segundo_parcial/controller/event_controller.dart';
import 'package:segundo_parcial/model/model.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  AddEventState createState() => AddEventState();
}

class AddEventState extends State<AddEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void addEvent() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String date = _dateController.text;
    String imageUrl = _imageUrlController.text;

    Event event = Event(
        title: title, description: description, date: date, imageUrl: imageUrl);

    EventController.saveEvents(event);

    _titleController.clear();
    _dateController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Registro de Eventos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            _buildTextField(_titleController, "Título", Icons.text_fields),
            const SizedBox(height: 20),
            _buildTextField(
                _descriptionController, "Descripción", Icons.description),
            const SizedBox(height: 20),
            _buildTextField(_dateController, "Fecha", Icons.calendar_today),
            const SizedBox(height: 20),
            _buildTextField(_imageUrlController, "Imagen (URL)", Icons.image),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: addEvent,
              icon: const Icon(Icons.save),
              label: const Text(
                "Guardar Evento",
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(900, 60),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder()),
    );
  }
}
