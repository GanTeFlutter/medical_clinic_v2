

import 'package:flutter/material.dart';
import 'package:medical_cliniv_v2/feature/home/view/doctor_deteals_view.dart';

abstract class DoctorDetealsViewModel extends State<DoctorDeteals>{
    void changeFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  bool isFavourite = false;
}