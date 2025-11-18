import 'package:flutter/material.dart';
import 'reto_textfield.dart'; // importa a la pantalla del reto.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo TextField',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. Crear el controlador
  final TextEditingController _controller = TextEditingController();
  String _textoIngresado = 'Nada aún...';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // 2. Importante: Liberar recursos del controlador
    _controller.dispose();
    super.dispose();
  }

  // Callback para manejar el cambio de texto
  void _onTextChanged() {
    setState(() {
      // 3. Leer el texto actual del controlador
      _textoIngresado = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 4. TextField con sus propiedades
            TextField(
              controller: _controller, // Asignar el controlador
              decoration: InputDecoration(
                labelText: 'Ingresa tu nombre',
                hintText: 'Escribe aquí...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Texto ingresado: $_textoIngresado', // Mostrar el texto en tiempo real
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ejemplo de cómo usar el texto del controlador en otro lugar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Saludo"),
                      content: Text("¡Que más ${_controller.text}, lo saluda el GAES 3!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Cerrar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Mostrar Saludo"),
            ),

            SizedBox(height: 30),

            // NUEVO: Botón para navegar al reto
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RetoTextField()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 247, 247),
              ),
              child: Text("Desarrollo del Reto."),
            ),
          ],
        ),
      ),
    );
  }
}
