import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas Seguro'),
        content: const Text(
            'Sit enim fugiat non sunt eiusmod enim in aliquip laborum. In consequat consectetur sint irure qui Lorem nisi esse dolore fugiat. Culpa laborum exercitation sunt ipsum laboris in ipsum tempor adipisicing enim laboris. Irure tempor cupidatat deserunt proident duis fugiat. Aute adipisicing tempor eu ea aute duis aute sit nisi anim ad magna sunt. Exercitation aliquip sint cillum ad laboris. Deserunt sunt voluptate ut reprehenderit laborum et laboris veniam nisi nisi.'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetElit consequat velit et amet ullamco magna culpa do. Ex exercitation officia labore culpa nostrud sint reprehenderit enim nulla cillum aliqua. Aliqua aute magna elit occaecat eiusmod. Duis laborum tempor culpa fugiat nisi id quis ut ex non Lorem in. Duis Lorem esse velit quis commodo do sint nisi incididunt. Magna aliqua dolore est esse sint. Ex deserunt ullamco ipsum elit nulla irure ipsum labore minim aliquip eiusmod quis.'),
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo de pantalla'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackBar(context);
        },
      ),
    );
  }
}
