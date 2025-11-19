import 'package:flutter/material.dart';
import 'reto_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo TextField',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Activar Material 3: más moderno
        colorSchemeSeed: Colors.green, // Paleta automática
        brightness: Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _textoIngresado = 'Nada aún...';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _textoIngresado = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text(
          'Demo TextField',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ingresa tus datos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // === TEXTFIELD BONITO ===
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Escribe aquí...',
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Texto moderno
            Text(
              'Texto ingresado:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                _textoIngresado,
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),

            // Botón elegante
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.message),
                label: const Text("Mostrar Saludo"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Saludo"),
                        content: Text("¡Qué más ${_controller.text}, lo saluda el GAES 3!"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cerrar"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Botón secundario
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                child: const Text("Desarrollo del Reto"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RetoTextField()),
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

