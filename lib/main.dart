import 'package:flutter/material.dart';
import 'reto_textfield.dart';

void main() {
  runApp(const MyApp()); // Punto de entrada: inicia la app.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo TextField',
      debugShowCheckedModeBanner: false, // Oculta la cinta de debug.
      theme: ThemeData(
        useMaterial3: true, // Activa Material 3.
        colorSchemeSeed: Colors.green, // Genera una paleta moderna.
      ),
      home: const MyHomePage(), // Pantalla principal.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController(); // Controla el TextField.
  String _textoIngresado = 'Nada aún...'; // Guarda lo que escribe el usuario.

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged); // Escucha cambios en tiempo real.
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador.
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _textoIngresado = _controller.text; // Actualiza el texto escrito.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo TextField'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(22.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ingresa tus datos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            // TextField con estilo moderno
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Escribe aquí...',
                filled: true,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Muestra el texto ingresado debajo
            Text('Texto ingresado:',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                _textoIngresado, // Se actualiza automáticamente
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),

            // Botón que muestra un alerta con el nombre
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.message),
                label: const Text("Mostrar Saludo"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Saludo"),
                      content: Text("¡Qué más ${_controller.text}, lo saluda el GAES 3!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cerrar"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Navega hacia la pantalla del reto
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                child: const Text("Desarrollo del Reto"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RetoTextField()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


