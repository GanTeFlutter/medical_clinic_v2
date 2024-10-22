import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/state/block/cubit/favorite_cubit_cubit.dart';

class FavoriteNews extends StatefulWidget {
  const FavoriteNews({super.key});

  @override
  State<FavoriteNews> createState() => _FavoriteNewsState();
}

class _FavoriteNewsState extends State<FavoriteNews> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<FavoriteCubitCubit, FavoriteCubitState>(
          builder: (context, state) {
            if (state is FavoriteCubitInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoriteCubitLoaded) {
              return GridView.builder(
                itemCount: state.favoriteNews.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var news = state.favoriteNews[index];
                  var newsindex = state.favoriteNews.indexOf(news);
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: screenHeight * 0.2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  image: AssetImage(news.photoUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<FavoriteCubitCubit>()
                                        .deleteFavoriteNews(newsindex);
                                  },
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.red)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.date.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Error'));
          },
        ));
  }
}
