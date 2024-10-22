import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_cliniv_v2/product/init/aplication_init.dart';
import 'package:medical_cliniv_v2/product/state/block/doctorCubit/doctor_cubit.dart';
import 'package:medical_cliniv_v2/product/state/provider/profile_photo/change_profile_photo.dart';
import 'package:provider/provider.dart';

import 'feature/bottomNavBar/bottom_nav_bar_v2.dart';
import 'product/state/block/cubit/favorite_cubit_cubit.dart';
import 'product/state/block/doctorCubit/cubit/doctor_fav_cubit_cubit.dart';
import 'product/state/block/newsCubit/news_cubit.dart';
import 'product/cache/change_app_theme.dart';
import 'product/theme/custom_dark_theme.dart';
import 'product/theme/custom_light_theme.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => ProviderChangeProfilePhoto()),
        BlocProvider(create: (context) => DoctorCubit()..getDoctors()),
        BlocProvider(create: (context) => NewsCubit()..getNews()),
        BlocProvider(
            create: (context) => FavoriteCubitCubit()..getFavoriteNews()),
            BlocProvider(create:  (context) => DoctorFavCubitCubit()..getFavoriteDoctors()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Medical Clini V2',
          debugShowCheckedModeBanner: false,
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          themeMode: themeProvider.themeMode,
          home: const BottomNavigationBarScreenV2(),
        ),
      ),
    );
  }
}


//deneme