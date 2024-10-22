import 'package:flutter/material.dart';
import 'package:medical_cliniv_v2/feature/favorite/screens/doctors_fav_view.dart';

import 'screens/news_fav.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  Future<void> _delete() async {}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _delete();
              },
              icon: const Icon(Icons.highlight_remove_outlined),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.newspaper),
                text: 'Favorite News',
              ),
              Tab(
                  icon: Icon(Icons.social_distance_outlined),
                  text: 'Favorite Doctors'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FavoriteNews(),
            DoctorsFavView(),
          ],
        ),
      ),
    );
  }
}
