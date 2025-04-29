# 🔥 DikkatYangın – Acil Yangın Uyarı Sistemi (Fire Alert System)

DikkatYangın, vatandaşların yakındaki yangınlardan **anlık olarak haberdar edilmesini** sağlayan Flutter tabanlı bir mobil uygulamadır. Bu sistemde **itfaiyeciler (admin)** yangın konumlarını (enlem/boylam) bildirir, sistem de **1 km yarıçapındaki** tüm kullanıcıları **push notification** ile uyarır.

## 🎯 Özellikler
- 👨‍🚒 **Admin Paneli**: İtfaiyeciler yangın konumlarını elle girip raporlar.
- 📍 **Konum Tabanlı Uyarı**: Kullanıcılar, yangınlara 1 km yakın olduklarında uyarı alır.
- 🛰️ **Gerçek Zamanlı Harita**: Kullanıcının mevcut konumunu ve tehlike bölgelerini gösterir.
- 🔔 **Push Notification**: Firebase Cloud Messaging (FCM) ile anlık bildirim desteği.

## 🧰 Kullanılan Teknolojiler
- **Flutter** – Mobil uygulama geliştirme
- **Firebase** – Gerçek zamanlı veritabanı, authentication ve bildirim servisi
- **Google Maps API** – Harita ve konum işlemleri
- **Geolocator** – Cihaz konumunu almak için
- **Provider / Bloc** – State management (seçim serbest)


