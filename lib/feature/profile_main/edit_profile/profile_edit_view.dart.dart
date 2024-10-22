
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/state/provider/profile_photo/change_profile_photo.dart';
import '../profile_view_model_all/profile_edit_view_model.dart';
import '../widget/custom_elevated_button.dart';
import 'change_profile_photo_view.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends ProfileEditViewModel {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Edit'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.04),
                //Kullanıcı avatarı
                avatarEdit(screenHeight),
                screenPadding(screenHeight),
                //Kullanıcı bilgileri
                personInformation(),
                screenPadding(screenHeight),
                //Kullanıcı sağlık bilgileri
                userHealthInformation(context),
                screenPadding(screenHeight),
                //Cinsiyet
                customDropdownButton(),
                screenPadding(screenHeight),
                //Kaydet butonu
                CustomSimpleElevatedButton(
                  onPressed: () {},
                  text: 'Save',
                  isIcon: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container userHealthInformation(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: Text('User health information',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.boy),
              hintText: 'Boy',
            ),
          ),
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.sentiment_satisfied_outlined),
                hintText: 'Kg',
              ),
            ),
          ),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.bloodtype),
              hintText: 'Kan Grubu',
            ),
          ),
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.medical_services_rounded),
                hintText: 'Kronik Hastalıklar',
              ),
            ),
          ),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.local_hospital),
              hintText: 'Alerjiler',
            ),
          ),
        ],
      ),
    );
  }

  Container personInformation() {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: Text('User information',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Name',
            ),
          ),
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Email',
              ),
            ),
          ),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.location_on),
              hintText: 'Location',
            ),
          ),
          Padding(
            padding: ScreenSpacialPadding.textFieldPadding(),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Phone Number',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container customDropdownButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DropdownButton(
        style: Theme.of(context).textTheme.bodyLarge,
        dropdownColor: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
        iconSize: 23,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        iconEnabledColor: Colors.grey[700],
        isExpanded: true,
        items: const [
          DropdownMenuItem(value: 'Male', child: Text('Male')),
          DropdownMenuItem(value: 'Woman', child: Text('Woman')),
          DropdownMenuItem(value: 'Other', child: Text('Other')),
        ],
        value: dropdownValue,
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }

  GestureDetector avatarEdit(double height) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheetCustom(height);
      },
      child: Stack(
        children: [
          Consumer<ProviderChangeProfilePhoto>(
            builder: (context, profilePhoto, child) {
              return profilePhoto.image.isNotEmpty
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profilePhoto.image),
                    )
                  : const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/image/app_icon/defaul_users_photo.png'),
                    );
            },
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showModalBottomSheetCustom(double height) {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.7),
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return SizedBox(
            height: height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangeProfilePhotoView(),
                        )).then(
                      (value) {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                    );
                  },
                  text: 'New Profile Photo',
                  isIcon: false,
                ),
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {},
                  text: 'Custom App Photo',
                  isIcon: false,
                ),
                ShowModalBottomSheetElevatedButton(
                  onPressed: () {},
                  text: 'Delete Photo',
                  isIcon: true,
                ),
              ],
            ));
      },
    );
  }

  SizedBox screenPadding(double screenHeight) =>
      SizedBox(height: screenHeight * 0.02);
}

class ShowModalBottomSheetElevatedButton extends StatefulWidget {
  const ShowModalBottomSheetElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.isIcon});

  final void Function()? onPressed;
  final String text;
  final bool isIcon;
  @override
  State<ShowModalBottomSheetElevatedButton> createState() =>
      _ShowModalBottomSheetElevatedButtonState();
}

class _ShowModalBottomSheetElevatedButtonState
    extends State<ShowModalBottomSheetElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            side: WidgetStateProperty.all(
                const BorderSide(width: 2, color: Colors.grey)),
            overlayColor:
                WidgetStateProperty.all(Colors.grey.withOpacity(0.2))),
        onPressed: widget.onPressed,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // İkon ve metni ortalar
            children: [
              Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(width: 10),
              widget.isIcon
                  ? const Icon(
                      Icons.delete_forever_rounded,
                      color: Colors.black,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenSpacialPadding {
  static EdgeInsets textFieldPadding() =>
      const EdgeInsets.symmetric(vertical: 8.0);
}
