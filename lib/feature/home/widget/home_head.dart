import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/state/provider/profile_photo/change_profile_photo.dart';
import '../view/notifications_view.dart';

class HeadImageNotificationIcon extends StatelessWidget {
  const HeadImageNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_chart_outlined,
                  size: 30,
                )),
            const NotificationIcon(
              notificationCount: 5,
            )
          ],
        ),
      ],
    );
  }
}

class NotificationIcon extends StatelessWidget {
  final int notificationCount;

  const NotificationIcon({super.key, required this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsView(),
                ));
          },
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 35,
          ),
        ),
        if (notificationCount > 0)
          Positioned(
            top: 5,
            left: 27,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 252, 120, 120),
                shape: BoxShape.circle,
              ),
              child: const Text(
                //   notificationCount.toString(),
                '12',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
