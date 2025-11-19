import 'package:flutter/material.dart';

class RetoTextField extends StatefulWidget {
  const RetoTextField({super.key});

  @override
  State<RetoTextField> createState() => _RetoTextFieldState();
}

class _RetoTextFieldState extends State<RetoTextField> {
  final TextEditingController controller = TextEditingController();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reto de la Clase",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ingresa un texto",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // === TEXTFIELD MODERNO ===
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Escribe algo",
                hintText: "Texto aquí...",
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // === BOTÓN PROFESIONAL ===
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    resultado = controller.text;
                  });
                },
                child: const Text("Mostrar texto"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Resultado:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            // === CONTENEDOR BONITO PARA EL RESULTADO ===
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                resultado.isEmpty ? "Aún no hay texto" : resultado,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

