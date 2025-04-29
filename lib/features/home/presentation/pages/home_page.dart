import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../widgets/fire_alert_ticker.dart';
import '../widgets/emergency_contact_card.dart';
import '../widgets/safety_tip_card.dart';
import '../widgets/fire_report_card.dart';
import '../widgets/fire_statistics_chart.dart';
import '../widgets/nearby_fires_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF3B30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Remix.fire_fill,
                color: Colors.white,
                size: 20,
              ),
            ),
            const Text(
              'DikkatYangın',
              style: TextStyle(
                color: Color(0xFFFF3B30),
                fontFamily: 'Pacifico',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Remix.user_3_line),
            onPressed: () {
              // TODO: Implement profile panel
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFireAlertsSection(),
            const SizedBox(height: 16),
            _buildNearbyFiresMap(),
            const SizedBox(height: 16),
            _buildEmergencyContacts(),
            const SizedBox(height: 16),
            _buildSafetyTips(),
            const SizedBox(height: 16),
            _buildRecentFireReports(),
            const SizedBox(height: 16),
            _buildFireStatistics(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFireAlertsSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFF3B30).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF3B30),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Remix.alarm_warning_fill,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              const Text(
                'Aktif Yangın Uyarıları',
                style: TextStyle(
                  color: Color(0xFFFF3B30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 32,
            child: FireAlertTicker(),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyFiresMap() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Yakındaki Yangınlar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: NearbyFiresMap(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyContacts() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Acil Durum İletişim',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                EmergencyContactCard(
                  title: 'İtfaiye',
                  subtitle: 'Acil Durum Hattı',
                  phoneNumber: '112',
                  icon: Remix.phone_fill,
                  isEmergency: true,
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                const Text(
                  'Yerel İtfaiye İstasyonları',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                EmergencyContactCard(
                  title: 'Beşiktaş İtfaiye İstasyonu',
                  subtitle: 'Yerel İstasyon',
                  phoneNumber: '0212 345 67 89',
                  icon: Remix.building_2_line,
                ),
                const SizedBox(height: 8),
                EmergencyContactCard(
                  title: 'Kadıköy İtfaiye İstasyonu',
                  subtitle: 'Yerel İstasyon',
                  phoneNumber: '0212 345 67 88',
                  icon: Remix.building_2_line,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyTips() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Güvenlik İpuçları',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Tümünü Gör',
                  style: TextStyle(
                    color: const Color(0xFFFF3B30),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                SafetyTipCard(
                  title: 'Tahliye Planı Hazırlayın',
                  description: 'Ailenizle birlikte pratik yapın',
                  imageUrl: 'https://readdy.ai/api/search-image?query=fire%20safety%20evacuation%20plan%2C%20illustration%2C%20educational%2C%20safety%20first&width=160&height=120&seq=1&orientation=landscape',
                ),
                const SizedBox(width: 12),
                SafetyTipCard(
                  title: 'Yangın Söndürücü Kullanımı',
                  description: 'PASS tekniğini öğrenin',
                  imageUrl: 'https://readdy.ai/api/search-image?query=fire%20extinguisher%20usage%2C%20illustration%2C%20educational%2C%20safety%20instructions&width=160&height=120&seq=2&orientation=landscape',
                ),
                const SizedBox(width: 12),
                SafetyTipCard(
                  title: 'Duman Dedektörü Kontrolü',
                  description: 'Aylık test yapın',
                  imageUrl: 'https://readdy.ai/api/search-image?query=smoke%20detector%20installation%2C%20illustration%2C%20educational%2C%20home%20safety&width=160&height=120&seq=3&orientation=landscape',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentFireReports() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Son Yangın Raporları',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              FireReportCard(
                location: 'İstanbul, Beşiktaş',
                date: '29 Nisan 2025, 14:30',
                status: 'Aktif',
                statusColor: const Color(0xFFFF3B30),
              ),
              const Divider(height: 1),
              FireReportCard(
                location: 'Antalya, Manavgat',
                date: '29 Nisan 2025, 12:15',
                status: 'Aktif',
                statusColor: const Color(0xFFFF3B30),
              ),
              const Divider(height: 1),
              FireReportCard(
                location: 'İzmir, Bornova',
                date: '29 Nisan 2025, 10:45',
                status: 'Kontrol Altında',
                statusColor: Colors.green,
              ),
              const Divider(height: 1),
              FireReportCard(
                location: 'Muğla, Marmaris',
                date: '28 Nisan 2025, 18:20',
                status: 'Söndürüldü',
                statusColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFireStatistics() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Yangın İstatistikleri',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Son 5 Ay',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: FireStatisticsChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Remix.home_4_fill, 'Ana Sayfa', true),
          _buildNavItem(Remix.map_pin_line, 'Harita', false),
          _buildNavItem(Remix.notification_3_line, 'Bildirimler', false),
          _buildNavItem(Remix.user_line, 'Profil', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? const Color(0xFFFF3B30) : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF3B30) : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
} 