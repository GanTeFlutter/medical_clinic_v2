import 'package:flutter/material.dart';
import 'package:medical_cliniv_v2/feature/favorite/favorites_view.dart';
import 'package:medical_cliniv_v2/feature/home/view/home_view.dart';
import 'package:medical_cliniv_v2/feature/map/map_view.dart';

import '../profile_main/profile/user_view.dart';

class BottomNavigationBarScreenV2 extends StatefulWidget {
  const BottomNavigationBarScreenV2({super.key});

  @override
  State<BottomNavigationBarScreenV2> createState() =>
      _BottomNavigationBarScreenV2State();
}

class _BottomNavigationBarScreenV2State
    extends State<BottomNavigationBarScreenV2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('Seçilen index: $index');
    });
  }

  final List<Widget> _pages = const [
    Berm(),
    FavoritesView(),
    MapSample(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 207, 207, 255),
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
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

class BosEkran extends StatefulWidget {
  const BosEkran({super.key});

  @override
  State<BosEkran> createState() => _BosEkranState();
}

class _BosEkranState extends State<BosEkran> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
