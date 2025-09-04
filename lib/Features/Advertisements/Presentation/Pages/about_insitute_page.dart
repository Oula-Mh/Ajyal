import 'package:ajyal/Features/Advertisements/Presentation/Widgets/top_adv_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppColors {
  static const primaryColor = Color(0xFF2F4170);
  static const secondaryColor = Color(0xFFa2e3f5);
  static const purple = Color(0xFFA38097);
  static const textGray = Color(0xFF555555);
  static const lightBackground = Color(0xFFF9F9F9);
}

class AboutInstitutePage extends StatelessWidget {
  const AboutInstitutePage({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          // 1. Background Image and Gradient
          _buildHeaderBackground(),

          // 2. Scrollable Content Sheet
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200), // Space for the header to show
                _buildContentSheet(context),
              ],
            ),
          ),

          // 3. Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // The fixed header background
  Widget _buildHeaderBackground() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        // You can replace this with an actual image
        image: DecorationImage(
          image: const AssetImage(
            "assets/images/header_bg.png",
          ), // IMPORTANT: Add a background image here
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/logo_withoutText.png", // Your logo
          height: 120,
        ),
      ),
    );
  }

  // The main content area that scrolls over the header
  Widget _buildContentSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          // Institute Name
          const Text(
            "معهد آجيال التعليمي",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),

          // About Section
          _buildSectionCard(
            child: Text(
              "نسعى لتقديم أفضل الخدمات التعليمية عبر نخبة من المدرسين الأكفاء وبيئة تعليمية حديثة ومريحة للطلاب.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                color: AppColors.textGray,
                height: 1.7,
              ),
            ),
          ),

          // Contact Info Section
          _buildSectionCard(
            child: Column(
              children: [
                _infoRow(
                  Icons.location_on,
                  "الموقع",
                  "جرمانا - موقف الوكالة - بناء لافي الدكاك",
                ),
                const Divider(height: 30, thickness: 0.5),
                _infoRow(Icons.phone, "الهاتف", "+963 944 123 456"),
              ],
            ),
          ),

          // Social Media Section
          _buildSocialButtons(),

          const SizedBox(height: 20),

          // --- Your TeacherAdvListView Widget ---
          // It's integrated directly here
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: const TeacherAdvListView(),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // A reusable card for content sections
  Widget _buildSectionCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  // A row for icon + text info
  Widget _infoRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 24),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGray,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Social media buttons row
  Widget _buildSocialButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialButton(
            FontAwesomeIcons.facebookF,
            const Color(0xFF1877F2),
            "https://www.facebook.com/Ajyal.Education.Center",
          ),
          _socialButton(
            FontAwesomeIcons.instagram,
            const Color(0xFFE4405F),
            "https://instagram.com",
          ),
          _socialButton(
            FontAwesomeIcons.youtube,
            const Color(0xFFFF0000),
            "https://youtube.com",
          ),
          _socialButton(
            FontAwesomeIcons.telegram,
            const Color(0xFF26A5E4),
            "https://telegram.org",
          ),
        ],
      ),
    );
  }

  // A single social media button
  Widget _socialButton(IconData icon, Color color, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => _launchUrl(url),
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.1),
          child: FaIcon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}
