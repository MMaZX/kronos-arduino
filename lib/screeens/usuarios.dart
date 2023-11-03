import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Datos de usuarios "),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      // color: Theme.of(context)
                      //     .colorScheme
                      //     .primary
                      //     .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      "Juan Perez",
                    ),
                    subtitle: Text("RS: Representante de Servicios"),
                    trailing: MaterialButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return const Dialog(
                                alignment: Alignment.center,
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: InfoDataDialog(),
                              );
                            },
                          );
                        },
                        child: const Text("data")),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class InfoDataDialog extends StatelessWidget {
  const InfoDataDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Información general"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Text("data");
            },
          )
        ],
      ),
    );
  }
}
