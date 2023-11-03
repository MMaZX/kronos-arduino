import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kronos/screeens/usuarios.dart';
import 'package:kronos/screeens/dashboard.dart';
import 'package:kronos/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool openAppbar = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      tileDrawer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    print(query.width);
    final index = ref.watch(indexDrawerProvider);
    return WillPopScope(
      onWillPop: () async {
        await showCupertinoDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text("Salir"),
              content: const Text(
                  'Esta seguro de salir de la aplicación, esto no eliminará su sesión activa.'),
              actions: [
                CupertinoButton(
                  child: const Text("Si"),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                CupertinoButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
        return false;
      },
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Image(
            image: AssetImage('assets/images/logo_ne.png'),
            height: 50,
          ),
          elevation: 0,
          leading: query.width > 576
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      openAppbar = !openAppbar;
                    });
                  },
                  icon: const Icon(Icons.menu_rounded))
              : null,
          automaticallyImplyLeading: query.width > 576 ? false : true,
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        drawer:
            query.width > 576.0 ? null : const Drawer(child: DraweHomeMenu()),
        body: Stack(
          children: [
            query.width > 576.0
                ? Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: openAppbar
                            ? 0
                            : (query.width > 992
                                ? query.width * 0.2
                                : query.width * 0.3),
                      ),
                      Expanded(
                        child: IndexHome(view: index),
                      ),
                    ],
                  )
                : IndexHome(view: index),
            query.width > 576.0
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: query.width > 992
                        ? query.width * 0.2
                        : query.width * 0.3,
                    transform: Matrix4.translationValues(
                        openAppbar ? -query.width * 0.4 : 0.0, 0.0, 0.0),
                    child: const DraweHomeMenu(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class IndexHome extends StatelessWidget {
  const IndexHome({
    super.key,
    required this.view,
  });

  final view;

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const UsuariosScreen();
      // case 2:
      //   return const SistemasScreen();
      // case 3:
      //   return const ClientesScreen();
      // case 4:
      //   return const SettingsScreen();
      // case 5:
      //   return const CombosScreen();
      // case 6:
      //   return const MensajesScreen();
      default:
        return const DashboardScreen();
    }
  }
}

class DraweHomeMenu extends ConsumerStatefulWidget {
  const DraweHomeMenu({
    super.key,
  });

  @override
  ConsumerState<DraweHomeMenu> createState() => _DraweHomeMenuState();
}

class _DraweHomeMenuState extends ConsumerState<DraweHomeMenu> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final watch = ref.watch(indexDrawerProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tileDrawer.length,
            itemBuilder: (context, index) {
              final dr = tileDrawer[index];
              return TileDrawer(
                title: dr.title,
                subtitle: dr.subtitle,
                current: () {
                  // if (Platform.isAndroid || Platform.isIOS) {
                  //   if (query.width > 576.0) {
                  //   } else {
                  //     Navigator.pop(context);
                  //   }
                  // } else {}

                  setState(() {
                    ref
                        .read(indexDrawerProvider.notifier)
                        .update((state) => dr.index);
                  });
                  print(watch);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class TileDrawer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? current;
  const TileDrawer({
    required this.current,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: current,
          subtitle: Opacity(
            opacity: 0.6,
            child: Text(
              subtitle,
            ),
          ),
        ),
      ),
    );
  }
}

final indexDrawerProvider = StateProvider<int>((ref) {
  return 0;
});

class DrawerOptions {
  String title;
  String subtitle;
  int index;

  DrawerOptions(
      {required this.title, required this.subtitle, required this.index});
}

List<DrawerOptions> tileDrawer = [
  DrawerOptions(
    title: 'Inicio',
    subtitle: 'Vista de resumen',
    index: 0,
  ),
  DrawerOptions(title: "Usuarios", subtitle: "Lista de trabajadores", index: 1),
  DrawerOptions(
      title: "Registrar trabajador",
      subtitle: "Crear un nuevo perfil",
      index: 2),
  DrawerOptions(
      title: "log KRONOS",
      subtitle: "Servicio de mantenimiento de registro",
      index: 3)
  // DrawerOptions(title: 'Negocios', subtitle: 'Lista de afiliados', index: 1),
  // DrawerOptions(title: 'Sistemas', subtitle: 'Información sistemas', index: 2),
  // DrawerOptions(
  //     title: 'Clientes',
  //     subtitle: 'Información de clientes afiliados',
  //     index: 3),
  // DrawerOptions(title: 'Settings', subtitle: 'Configura el app', index: 4),
  // DrawerOptions(
  //     title: 'Combos Facturación', subtitle: 'Sistema de combos', index: 5),
  // DrawerOptions(
  //     title: 'Mensajes a Sistemas',
  //     subtitle: 'Push Notifications Systems',
  //     index: 6)
];
