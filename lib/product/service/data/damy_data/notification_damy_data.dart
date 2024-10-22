import '../../../model/notification_model.dart';

class NotificationDamy {
  List<NewNotificationModel> dummyNotifications = [
    NewNotificationModel(
      id: '1',
      title: 'Yeni Aşı Duyurusu',
      description:
          'COVID-19 aşısının yeni sürümü artık mevcut. Hızla randevu almayı unutmayın!',
      path: '/notifications/vaccine-update',
      checked: false,
    ),
    NewNotificationModel(
      id: '2',
      title: 'Düzenli Kontrol Hatırlatıcısı',
      description:
          'Yıllık sağlık kontrolünüz için randevunuz yaklaşmakta. Sağlığınızı ihmal etmeyin!',
      path: '/notifications/annual-checkup',
      checked: false,
    ),
    NewNotificationModel(
      id: '3',
      title: 'Sağlıklı Yaşam İpuçları',
      description:
          'Daha sağlıklı bir yaşam için uygulamanız gereken 7 önemli ipucu hakkında bilgi edinin.',
      path: '/notifications/healthy-living-tips',
      checked: false,
    ),
    NewNotificationModel(
      id: '4',
      title: 'Yeni Tedavi Yöntemleri',
      description:
          'Kanser tedavisindeki yenilikler ve gelişmeler hakkında bilgi alın.',
      path: '/notifications/new-treatment-methods',
      checked: false,
    ),
    NewNotificationModel(
      id: '5',
      title: 'Aşılama Programı',
      description:
          'Bu hafta sonu düzenlenecek aşılama programına katılmak için kayıt olun!',
      path: '/notifications/vaccination-program',
      checked: false,
    ),
    NewNotificationModel(
      id: '6',
      title: 'Ruh Sağlığı Duyurusu',
      description:
          'Ruh sağlığınızı korumak için online destek grubu toplantısına katılın.',
      path: '/notifications/mental-health-support',
      checked: false,
    ),
    NewNotificationModel(
      id: '7',
      title: 'Beslenme Danışmanlığı',
      description:
          'Dengeli beslenme konusunda uzman doktorlarımızla birebir görüşme fırsatı.',
      path: '/notifications/nutrition-counseling',
      checked: false,
    ),
    NewNotificationModel(
      id: '8',
      title: 'Kilo Yönetimi Programı',
      description:
          'Kilo yönetimi konusunda yardımcı olacak yeni programımız hakkında bilgi alın.',
      path: '/notifications/weight-management',
      checked: false,
    ),
    NewNotificationModel(
      id: '9',
      title: 'Dijital Sağlık Uygulamaları',
      description:
          'Sağlığınızı takip etmek için en iyi dijital uygulamalar hakkında bilgi edinin.',
      path: '/notifications/digital-health-apps',
      checked: false,
    ),
    NewNotificationModel(
      id: '10',
      title: 'Acil Durum Bilgilendirmesi',
      description:
          'Klinikteki acil durumlar hakkında güncel bilgilere erişim sağlayın.',
      path: '/notifications/emergency-updates',
      checked: false,
    ),
  ];
}
