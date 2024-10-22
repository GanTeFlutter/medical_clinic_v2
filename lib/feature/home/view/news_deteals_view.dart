import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_cliniv_v2/product/model/news/news_model.dart';

import '../../../product/state/block/cubit/favorite_cubit_cubit.dart';
import '../widget/image_card_docdor_and_news.dart';

class NewsDetealsView extends StatefulWidget {
  const NewsDetealsView({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  State<NewsDetealsView> createState() => _NewsDetealsViewState();
}

class _NewsDetealsViewState extends State<NewsDetealsView> {
  bool isFavourite = false;
  void changeFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  Future<void> addNewsCubit() async {
    context.read<FavoriteCubitCubit>().addFavoriteNews(widget.newsModel);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetealsView'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //method
              imageCardDocdorAndNewsWidget(screenHeight),
              screenPadding(screenHeight),
              Row(
                children: [
                  Text('Title: ${widget.newsModel.title}'),
                  const Spacer(),
                  Text('Date: ${widget.newsModel.date}'),
                ],
              ),
              screenPadding(screenHeight),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 6,
                    ),
                  ],
                  color: const Color.fromARGB(255, 223, 224, 241),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.newsModel.description * 5,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              screenPadding(screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  ImageCardDocdorAndNews imageCardDocdorAndNewsWidget(double screenHeight) {
    //önce method olarak çıkarttım sonrasında widget olarak döndürdüm
    return ImageCardDocdorAndNews(
      title: widget.newsModel.title,
      height: screenHeight * 0.4,
      assetName: widget.newsModel.photoUrl,
      icon: isFavourite
          ? const Icon(Icons.favorite_rounded, color: Colors.red)
          : const Icon(Icons.favorite_border_rounded, color: Colors.blue),
      isFavourite: isFavourite,
      onPressed: () async {
        changeFavourite();
        await addNewsCubit();
      },
    );
  }

  SizedBox screenPadding(double screenHeight) =>
      SizedBox(height: screenHeight * 0.02);
}
