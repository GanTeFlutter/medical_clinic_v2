import 'package:flutter/material.dart';
import '../../../product/model/doctor/doctor_model.dart';
import '../view/doctor_deteals_view.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.width,
    required this.doctorModel,
  });
  final DoctorModel doctorModel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenPadding().edgeInsets,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: ScreenPadding().edgeInsets,
          child: Row(
            children: [
              doctorImage(),
              SizedBox(width: width * 0.03),
              doctorInfirmation(context),
              starAndPoint(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded starAndPoint(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_outlined,
                color: Color.fromARGB(255, 255, 230, 0),
                size: 23,
              ),
              Text(
                doctorModel.rating.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: const Alignment(0.3, 0),
            child: IconButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Köşeleri yuvarlatır
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                    const Color(0xff3E69FE)), // Arka plan rengini belirler
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DoctorDeteals(doctorModel: doctorModel),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded doctorInfirmation(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorModel.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            doctorModel.specialty,
            style: context.greyTextTheme,
          ),
          workingHours(),
          Text(
            doctorModel.currentWorkplace,
            style: context.greyTextTheme,
          ),
        ],
      ),
    );
  }

  Padding workingHours() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          const Icon(Icons.access_time_outlined, color: Colors.black, size: 15),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              doctorModel.workingHours,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded doctorImage() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
              width: 100,
              image: AssetImage(doctorModel.photoUrl),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}

extension _GreyTextTheme on BuildContext {
  TextStyle get greyTextTheme => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontStyle: FontStyle.italic,
        color: Colors.black.withOpacity(0.2), // Set opacity here
        fontSize: 14,
      );
}

class ScreenPadding {
  EdgeInsets edgeInsets = const EdgeInsets.all(8);
}
