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

🛡️ İzinler
Uygulama düzgün çalışması için aşağıdaki izinleri ister:
Cihaz konumu
İnternet bağlantısı
Bildirim izni

📷 Ekran Görüntüleri
<img width="1212" alt="Map Navigation Mobile App UI Kit Template (Community)@2x" src="https://github.com/user-attachments/assets/f740e926-9568-4748-8516-3c7a5233ea13" />
