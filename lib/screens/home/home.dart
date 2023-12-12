import 'package:acwhale/utils/logger.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB onPressed logic here
        },
        child: const Icon(Icons.edit),
      ),
      body: ListView(
        children: const [
          Card(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Elevated Card')),
            ),
          ),
          Card(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Elevated Card')),
            ),
          ),
        ],
      ),
    );
  }
}
