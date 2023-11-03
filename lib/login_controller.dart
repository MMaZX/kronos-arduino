import 'package:cloud_functions/cloud_functions.dart';

// Future<void> functionCrearUsuario() async {
//   final HttpsCallable callable =
//       FirebaseFunctions.instance.httpsCallable('crearUsuario');

//   try {
//     final result = await callable.call({
//       'nombres': 'fulanito',
//       'dni': '12345678',
//       'correo': 'fulanito',
//       'contraseña': 'fulanito',
//       'rol': '0',  //TODO si es 0 es admin si es 1 es usuario normal
//       'estado': 'activo', //TODO esto de aqui despues lo explico.
//       'rango': 'RS', // TODO aqui esta el tipo de rango mas que todo es un nombre nomás esto no tiene validacion
//     });
//     print(result.data);
//   } catch (e) {
//     print('Error al llamar a la función: $e');
//   }
// }
