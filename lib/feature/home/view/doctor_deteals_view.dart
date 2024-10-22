import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_cliniv_v2/product/model/doctor/doctor_model.dart';
import 'package:medical_cliniv_v2/product/state/block/doctorCubit/cubit/doctor_fav_cubit_cubit.dart';

import '../view_model/doctor_deteals_view_model.dart';
import '../widget/image_card_docdor_and_news.dart';

class DoctorDeteals extends StatefulWidget {
  const DoctorDeteals({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  State<DoctorDeteals> createState() => _DoctorDetealsState();
}

class _DoctorDetealsState extends DoctorDetealsViewModel {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    //  var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),
            imageCardDocdorAndNewsWidget(screenHeight),
            screenPadding(screenHeight),
            doctorNameAndNumberOfViews(context),
            doctorWorkingHours(context),
            screenPadding(screenHeight),
            doctorDesciription(),
            screenPadding(screenHeight),
            doctorFeaturesIcons(),
            screenPadding(screenHeight),
            locationAndNavigate(context),
            screenPadding(screenHeight),
            buttons()
          ],
        ),
      )),
    );
  }

  ImageCardDocdorAndNews imageCardDocdorAndNewsWidget(double screenHeight) {
    //imageCardDocdorAndNews=method extract
    return ImageCardDocdorAndNews(
      title: widget.doctorModel.name,
      height: screenHeight * 0.4,
      assetName: widget.doctorModel.photoUrl,
      icon: isFavourite
          ? const Icon(Icons.favorite_rounded, color: Colors.red)
          : const Icon(Icons.favorite_border_rounded, color: Colors.blue),
      isFavourite: isFavourite,
      onPressed: () {
        changeFavourite();
        context
            .read<DoctorFavCubitCubit>()
            .addFavoriteDoctor(widget.doctorModel);
      },
    );
  }

  SizedBox screenPadding(double screenHeight) =>
      SizedBox(height: screenHeight * 0.02);

  Text doctorWorkingHours(BuildContext context) {
    return Text(
      widget.doctorModel.workingHours,
      style: context.italicText,
    );
  }

  Container doctorDesciription() {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: Text(
        "AkeCompantDamy graduated from Istanbul University Faculty of Medicine and specializes in internal medicine. With over ten years of experience, he is known for his compassionate care and commitment to patient health.",
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Row buttons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 90, 95, 224)),
              minimumSize: WidgetStateProperty.all(
                  const Size.fromHeight(60)), // Buton yüksekliği ayarlandı
            ),
            onPressed: () {},
            child: Text('Online interview',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: ElevatedButton(
            
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 90, 95, 224),
              ),
              minimumSize: WidgetStateProperty.all(
                  const Size.fromHeight(60)), // Buton yüksekliği ayarlandı
            ),
            onPressed: () {},
            child: Text(
              'Meeting',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }

  Row locationAndNavigate(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        Text(
          widget.doctorModel.currentWorkplace.toString(),
          style: context.italicText,
        ),
      ],
    );
  }

  Row doctorFeaturesIcons() {
    return Row(
      children: [
        doctorThree(Icons.person, number: '+154', test: 'Patients'),
        doctorThree(Icons.work_history_outlined,
            number: widget.doctorModel.experienceYears, test: 'Yerars'),
        doctorThree(Icons.star_border_purple500_outlined,
            number: widget.doctorModel.rating, test: 'Rating'),
        doctorThree(Icons.phone_in_talk_outlined,
            number: '+90', test: 'Reviews'),
      ],
    );
  }

  Expanded doctorThree(IconData? icon, {dynamic number, String? test}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 35,
            ),
          ),
          const SizedBox(height: 5),
          Text(number.toString()),
          const SizedBox(height: 5),
          Text(test ?? 'doctor'),
        ],
      ),
    );
  }

  Row doctorNameAndNumberOfViews(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.doctorModel.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.black.withOpacity(0.2),
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "(96)",
            ),
          ],
        )
      ],
    );
  }
}

extension _GreyTextTheme on BuildContext {
  TextStyle get italicText => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontStyle: FontStyle.italic,
        color: Colors.black.withOpacity(0.3),
        fontSize: 15,
      );
}
