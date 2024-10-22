import 'package:flutter/foundation.dart';

class ProviderChangeProfilePhoto extends ChangeNotifier {
  final Map<int, String> _userProfile = {
    0: 'assets/image/app_icon/change_profile_photo_1.png',
    1: 'assets/image/app_icon/change_profile_photo_2.png',
    2: 'assets/image/app_icon/change_profile_photo_3.png',
    3: 'assets/image/app_icon/change_profile_photo_4.png',
    4: 'assets/image/app_icon/change_profile_photo_5.png',
  };

  String _updateimage = '';
  String get image => _updateimage;

  void updateChangeProfilePhoto(int index) {
    if (_userProfile.containsKey(index)) {
      _updateimage = _userProfile[index]!;
    } else {
      _updateimage = 'assets/image/app_icon/change_profile_photo_5.png';
     
    }
    notifyListeners();
  }
}
