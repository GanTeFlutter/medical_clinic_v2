import 'package:flutter/material.dart';

import '../../product/utility/constant/application_colors.dart';
import '../home/view/home_view.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('Seçilen index: $index');
    });
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: const [
              HomeView(),
              BosEkran(),
              BosEkran(),
              BosEkran(),
            ],
          ),
          bottomNavigationBar(),
        ],
      ),
    );
  }

  Positioned bottomNavigationBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 233, 234, 247),
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            selectedItemColor: ApplicationColors.blue,
            unselectedItemColor: ApplicationColors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.navigation_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BosEkran extends StatelessWidget {
  const BosEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bos Ekran',
            style: TextStyle(fontSize: 24, color: Colors.red)),
      ),
    );
  }
}
