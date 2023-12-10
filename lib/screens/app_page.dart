import 'package:acwhale/screens/admin/admin.dart';
import 'package:acwhale/screens/home/home.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const HomePage(), const AdminPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AC-WHALE'),
        ),
        // body: IndexedStack(
        //   index: _currentIndex,
        //   children: _pages,
        // ),
        body: _pages[_currentIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined),
              label: 'Home',
            ),
          ],
        ));
  }
}
