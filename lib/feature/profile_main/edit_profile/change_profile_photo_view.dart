import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/state/provider/profile_photo/change_profile_photo.dart';
import '../widget/custom_elevated_button.dart';

class ChangeProfilePhotoView extends StatefulWidget {
  const ChangeProfilePhotoView({super.key});

  @override
  State<ChangeProfilePhotoView> createState() => _ChangeProfilePhotoViewState();
}

class _ChangeProfilePhotoViewState extends State<ChangeProfilePhotoView> {
  final Map<int, String> _userProfile = {
    0: 'assets/image/app_icon/change_profile_photo_1.png',
    1: 'assets/image/app_icon/change_profile_photo_2.png',
    2: 'assets/image/app_icon/change_profile_photo_3.png',
    3: 'assets/image/app_icon/change_profile_photo_4.png',
    4: 'assets/image/app_icon/change_profile_photo_5.png',
    5: 'assets/image/app_icon/change_profile_photo_6.png',
    6: 'assets/image/app_icon/change_profile_photo_7.png',
  };

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Profile Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            section1(screenHeight, 0, 1),
            section1(screenHeight, 2, 4),
            section1(screenHeight, 5, 6),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              child: CustomSimpleElevatedButton(
                onPressed: () {
                  if (_selectedIndex != null) {
                    if (kDebugMode) {
                      print("Seçilen resim: ${_userProfile[_selectedIndex!]}");
                      Provider.of<ProviderChangeProfilePhoto>(context,
                              listen: false)
                          .updateChangeProfilePhoto(_selectedIndex!);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Lütfen bir resim seçiniz!'),
                        ),
                      );
                    }
                  }
                },
                text: 'Save',
                isIcon: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded section1(double screenHeight, int index1, int index2) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == index1 ? Colors.grey : Colors.white,
                  border: Border.all(
                    color: _selectedIndex == index1
                        ? Colors.grey
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    height: screenHeight * 0.15,
                    image: AssetImage(_userProfile[index1]!),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index2;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == index2 ? Colors.grey : Colors.white,
                  border: Border.all(
                    color: _selectedIndex == index2
                        ? Colors.grey
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    height: screenHeight * 0.15,
                    image: AssetImage(_userProfile[index2]!),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
