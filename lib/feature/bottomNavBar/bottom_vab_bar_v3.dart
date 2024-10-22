import 'package:flutter/material.dart';

import '../../product/utility/constant/application_colors.dart';

class BottomNavigationBarScreenV3 extends StatefulWidget {
  const BottomNavigationBarScreenV3({super.key});

  @override
  State<BottomNavigationBarScreenV3> createState() =>
      _BottomNavigationBarScreenV3State();
}

class _BottomNavigationBarScreenV3State
    extends State<BottomNavigationBarScreenV3> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = const [
    HomePage(),
    BosEkran(),
    BosEkran(),
    BosEkran(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Padding(
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
        child: Text('Boş Ekran',
            style: TextStyle(fontSize: 24, color: Colors.red)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
