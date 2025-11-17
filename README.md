# Demo TextField con TextEditingController

Una aplicación Flutter de ejemplo que demuestra cómo usar `TextEditingController` para leer, controlar y reaccionar al texto ingresado por el usuario en tiempo real.

##  Funcionalidades TextEditingController

- Captura de texto con `TextEditingController`.
- Actualización en tiempo real del texto mostrado.
- Uso de `addListener` para detectar cambios.
- Ejemplo de uso del texto en un diálogo emergente.

##  Componentes usados en la aplicacion

- `TextEditingController`: Para controlar el campo de texto.
- `TextField`: Campo de entrada para el usuario.
- `addListener`: Detecta cambios en tiempo real.
- `setState`: Actualiza la interfaz con el texto ingresado.
- `ElevatedButton`: Dispara una acción que usa el texto.

##  Ejemplo de uso

1. El usuario ingresa su nombre en el campo de texto.
2. La app muestra en tiempo real el texto ingresado.
3. Al presionar el botón “Mostrar Saludo”, aparece un diálogo con el texto ingresado.

##  Cómo ejecutar

### Requisitos

- Flutter instalado (versión 3.0 o superior).
- SDK de Dart.

## Pasos

```bash
flutter pub get descarga las dependecias para cuando usamos el repositorio 
flutter run para ejecutar la aplicacion 