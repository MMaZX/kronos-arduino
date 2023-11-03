import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:kronos/dashboard.dart';
import 'package:kronos/home.dart';
import 'package:kronos/widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_ne.png', width: 200),
                const Text(
                  "GEALAC",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFOrmCUstom(
                    label: "Correo Electronico",
                    controller: controller,
                    defaultColor: defaultColor),
                TextFOrmCUstom(
                  label: "Contraseña",
                  controller: controller,
                  defaultColor: defaultColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: MaterialButton(
                    color: defaultColor,
                    shape: rounded,
                    minWidth: 300,
                    padding: const EdgeInsets.all(20),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFOrmCUstom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Color defaultColor;
  const TextFOrmCUstom({
    super.key,
    required this.controller,
    required this.label,
    required this.defaultColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: defaultColor.withOpacity(0.5), width: 2),
            borderRadius: BorderRadius.circular(12)),
        // elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ),
    );
  }
}
