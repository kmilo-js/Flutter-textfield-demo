import 'package:flutter/material.dart';

class RetoTextField extends StatefulWidget {
  @override
  _RetoTextFieldState createState() => _RetoTextFieldState();
}

class _RetoTextFieldState extends State<RetoTextField> {

  // ✔ PASO 1 – Crear el controlador
  // Este controlador permitirá leer lo que el usuario escribe.
  final TextEditingController controller = TextEditingController();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RETO DE LA CLASE")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // TEXTFIELD CONECTADO AL CONTROLADOR
            TextField(
               // ✔ PASO 2 – Conectar el controlador con el TextField
              controller: controller,
              decoration: InputDecoration(
                labelText: "Escribe algo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Mostrar texto"),
              onPressed: () {
                 // ✔ PASO 3 – Actualizar el texto al presionar el botón
                setState(() {
                  resultado = controller.text;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
