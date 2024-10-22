import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/state/block/newsCubit/news_cubit.dart';
import '../../../product/state/block/doctorCubit/doctor_cubit.dart';
import 'news_deteals_view.dart';
import 'see_all_doctors_view.dart';

import '../view_model/home_view_model.dart';
import 'see_all_news_views.dart.dart';
import '../widget/doctor_card.dart';
import '../widget/home_head.dart';

class Berm extends StatelessWidget {
  const Berm({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: AppPaddingConstant.edgeInsets,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),
              const HeadImageNotificationIcon(),
              const SizedBox(height: 15),
              oneNotification(height, context),
              seeAllTextCustom(context, 'See All News', const SeeAllNews()),
              newsBlocBuilder(height, width),
              seeAllTextCustom(
                  context, 'See All Doctors', const SeeAllDoctorsV2()),
              doctorCardBlocBuilder(width)
            ],
          ),
        ));
  }

  GestureDetector oneNotification(double height, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: height * 0.12,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded,
                  size: 35, color: Colors.blue),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Merhaba, Kadir',
                      style: context.displayLarge.copyWith(
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bu gün nasılsın? Laboratuvar sonuçların çıktı, kontrol etmeye ne dersin?',
                      style: context.bodyLarge.copyWith(
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container newsBlocBuilder(double height, double width) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.2,
              blurRadius: 10,
              offset: const Offset(-1, 1)),
        ],
      ),
      height: height * 0.25,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: AppPaddingConstant.newsListViewBuilder,
              itemCount: 3,
              itemBuilder: (context, index) {
                final news = state.news[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetealsView(
                          newsModel: news,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.25,
                    width: width * 0.5,
                    margin: AppPaddingConstant.newsCard,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(news.photoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.3),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          news.title,
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(1, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          maxLines:
                              2, // Başlığın uzun olmasına karşılık satır sınırlaması
                          overflow: TextOverflow
                              .ellipsis, // Uzun metinlerin sonuna "..." koyar
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),
    );
  }

  Expanded doctorCardBlocBuilder(double width) {
    return Expanded(
      flex: 3,
      child: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is DoctorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DoctorLoaded) {
            return ListView.builder(
              padding: AppPaddingConstant.blocDocBuild,
              itemCount: 3,
              itemBuilder: (context, index) {
                final doc = state.doctors[index];

                return DoctorCard(
                  doctorModel: doc,
                  width: width,
                );
              },
            );
          }

          return const Center(child: Text('Data not found'));
        },
      ),
    );
  }

  Row seeAllTextCustom(BuildContext context, String data, Widget wid) {
    return Row(
      children: [
        const Spacer(),
        Text(data),
        IconButton(
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => wid));
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  RichText headerText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Merhaba, ',
            style: context.displayLarge,
          ),
          TextSpan(
            text:
                'kadir bu gün nasılsın,Labaratuar Sounçların Çıktı Kontrol etmeye ne dersin ',
            style: context.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class AppPaddingConstant {
  static const EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets newsListViewBuilder = EdgeInsets.only(
    top: 0,
  );
  static const EdgeInsets blocDocBuild = EdgeInsets.only(top: 0, bottom: 75);
  static const EdgeInsets newsCard = EdgeInsets.all(8.0);
}

extension _ButtonTextThemeKisaKullanim on BuildContext {
  TextStyle get displayLarge => Theme.of(this).textTheme.titleLarge!.copyWith(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      );
}

extension _ButtonTextThemeKisaKullanim2 on BuildContext {
  TextStyle get bodyLarge => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 15,
      );
}
