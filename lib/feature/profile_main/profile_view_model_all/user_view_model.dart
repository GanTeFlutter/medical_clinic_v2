import 'package:flutter/material.dart';

import '../profile/mixin/connection_mixin.dart';
import '../profile/user_view.dart';

abstract class UserViewModel extends State<UserProfile> with ConnectMixin {
  bool darkTheme = false;
  bool autoThemeSwitch = false;
  bool autoPlaySwitch = false;
  bool userLoginPinSwitch = false;
}
