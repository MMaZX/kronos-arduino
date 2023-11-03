import 'package:flutter/material.dart';
import 'package:kronos/widgets/widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    final defaultColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            title: Text("Registro de ausencias"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.circle),
                      title: Text("Apertura : 10:00pm"),
                      subtitle: Text("trabajador$index"),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
