import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_cliniv_v2/product/cache/change_app_theme.dart';
import 'package:provider/provider.dart';

import '../../../product/state/provider/profile_photo/change_profile_photo.dart';
import '../edit_profile/profile_edit_view.dart.dart';
import '../profile_view_model_all/user_view_model.dart';
import '../settings/settings_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends UserViewModel {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Consumer<ThemeProvider>(
            builder:
                (BuildContext context, ThemeProvider value, Widget? child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.06),
                      avatarAndUserInformation(screenwidth),
                      screenPadding(screenHeight),
                      profileEditAndSettingsButtons(),
                      SizedBox(height: screenHeight * 0.04),
                      appInformation(screenHeight),
                      SizedBox(height: screenHeight * 0.04),
                      preferences(screenHeight),
                      SizedBox(height: screenHeight * 0.08),
                    ],
                  ),
                  if (value.isProfileBlur)
                    IgnorePointer(
                      ignoring: true,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Column appInformation(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('App Information',
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
        screenPadding(screenHeight),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.document_scanner_outlined),
                title: const Text('Laboratory results'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.medical_services),
                title: const Text('Medical Services'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.watch_later),
                title: const Text('Doctor Appointment'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings_backup_restore_sharp),
                title: const Text('Past Conversations'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.stars_outlined),
                title: const Text('Ratings'),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Column preferences(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Preferences',
            style:
                GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold)),
        screenPadding(screenHeight),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          //Consumer ile provideri dinlemeye basliyoruz
          child: Consumer<ThemeProvider>(
            builder: (
              BuildContext context,
              ThemeProvider changeThemeValue,
              Widget? child,
            ) {
              return Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Language'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Theme'),
                    trailing: Switch(
                      value: changeThemeValue.isDarkTheme,
                      onChanged: (value) {
                        //provider ile veri alıyoruz
                        context.read<ThemeProvider>().setThemeMode(
                            //yine enum uzerinden veri gonderiyoruz
                            value ? ThemeMode.dark : ThemeMode.light);
                      },
                      activeColor: const Color.fromARGB(255, 90, 95, 224),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.light_mode_rounded),
                    title: const Text('Light Theme'),
                    trailing: Switch(
                      //provider ile veri alıyoruz
                      value: changeThemeValue.isLightTheme,
                      onChanged: (value) {
                        //yine enum uzerinden veri gonderiyoruz
                        context.read<ThemeProvider>().setThemeMode(
                            value ? ThemeMode.light : ThemeMode.dark);
                      },
                    ),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.system_security_update_good_rounded),
                    title: const Text('System Theme (Phone)'),
                    trailing: Switch(
                      //provider ile veri alıyoruz
                      value: changeThemeValue.isSystemTheme,
                      onChanged: (value) {
                        //yine enum uzerinden veri gonderiyoruz
                        context.read<ThemeProvider>().setThemeMode(
                            value ? ThemeMode.system : ThemeMode.light);
                      },
                    ),
                  ),
                  ListTile(
                      leading: const Icon(Icons.login_rounded),
                      title: const Text('Auto Login'),
                      trailing: Switch(
                        value: autoPlaySwitch,
                        onChanged: (value) {
                          setState(() {
                            autoPlaySwitch = value;
                          });
                        },
                      )),
                  ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('User Login Pin'),
                      trailing: Switch(
                        value: userLoginPinSwitch,
                        onChanged: (value) {
                          setState(() {
                            userLoginPinSwitch = value;
                          });
                        },
                      )),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help-Support'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text('Privacy Policy'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('Security'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Sign Out'),
                    onTap: () {},
                  ),
                ],
              );
            },
            child: const CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  SizedBox screenPadding(double screenHeight) =>
      SizedBox(height: screenHeight * 0.02);

  Row avatarAndUserInformation(double screenwidth) {
    return Row(
      children: [
        Consumer<ProviderChangeProfilePhoto>(
          builder: (context, profilePhoto, child) {
            return profilePhoto.image.isNotEmpty
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profilePhoto.image),
                  )
                : ClipOval(
                    child: Image.asset(
                      'assets/image/app_icon/defaul_users_photo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover, // Görüntüyü kapsamak için
                    ),
                  );
          },
        ),
        //
        SizedBox(width: screenwidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billl Gates',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 5),
            Text(
              'bilgates_123@gmail.com',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }

  Row profileEditAndSettingsButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEdit(),
                ),
              );
            },
            label: Text(
              'Profile Edit',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.edit,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: ElevatedButton.icon(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              );
            },
            label: Text(
              'Settings',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.settings,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
