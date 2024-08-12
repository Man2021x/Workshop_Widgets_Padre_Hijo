import 'package:flutter/material.dart';

main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Comunicación Padre-Hijo',
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  String message = "Hola desde el widget padre!";

  void updateMessage(String newMessage) {
    setState(() {
      message = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Padre'),
      ),
      body: Center(
        child: ChildWidget(
          message: message,
          onMessageChange: updateMessage,
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final String message;
  final Function(String) onMessageChange;

  const ChildWidget({
    super.key,
    required this.message,
    required this.onMessageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            onMessageChange("¡Mensaje cambiado desde el widget hijo!");
          },
          child: const Text("Cambiar Mensaje"),
        ),
      ],
    );
  }
}
