import 'package:flutter/material.dart';

import '../edit_profile/profile_edit_view.dart.dart';

abstract class ProfileEditViewModel extends State<ProfileEdit> {
  String avatarUrl = 'assets/image/genel/medical_clinic_appicon_v2.png';
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController sehir = TextEditingController();

  String dropdownValue = 'Other';
}
