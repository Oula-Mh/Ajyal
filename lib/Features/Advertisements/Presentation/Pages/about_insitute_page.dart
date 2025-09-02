import 'package:ajyal/Features/Advertisements/Presentation/Widgets/top_adv_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class AppColors {
  static const primaryColor = Color(0xFF2F4170); // كحلي غامق
  static const secondaryColor = Color(0xFFa2e3f5); // سماوي فاتح
  static const purple = Color(0xFFA38097); // موف
  static const lightBackground = Color(0xFFF9F9F9);
  static const textGray = Color(0xFF707070);
  static const gradientLight = Color(0xFF415B91);
}

class AboutInstitutePage extends StatelessWidget {
  const AboutInstitutePage({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('تعذر فتح $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // 🔹 الهيدر مع التدرج
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.gradientLight,
                        AppColors.secondaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                // 🔹 اللوغو بشكل شفاف
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/logo_withoutText.png",
                    height: 230,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "معهد آجيال التعليمي",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "نسعى لتقديم أفضل الخدمات التعليمية عبر نخبة من المدرسين الأكفاء وبيئة تعليمية حديثة ومريحة للطلاب.",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
                // 🔹 Container شفاف بأسلوب Glassmorphism
                Positioned(
                  bottom: -120,
                  left: width * 0.06,
                  right: width * 0.06,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 230, 244, 251),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // 🔹 الموقع
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 24,
                                  color: AppColors.purple,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "جرمانا - موقف الوكالة - بناء لافي الدكاك",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // 🔹 الهاتف
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 24,
                                  color: AppColors.purple,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "+963 944 123 456",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // 🔹 أيقونات التواصل
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialButton(
                                  FontAwesomeIcons.facebook,
                                  AppColors.primaryColor,
                                  "https://www.facebook.com/Ajyal.Education.Center",
                                ),
                                _socialButton(
                                  FontAwesomeIcons.instagram,
                                  AppColors.purple,
                                  "https://instagram.com",
                                ),
                                _socialButton(
                                  FontAwesomeIcons.youtube,
                                  Colors.red,
                                  "https://youtube.com",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 130),
            // 🔹 سلايدر صور
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200,
            //     autoPlay: true,
            //     enlargeCenterPage: true,
            //   ),
            //   items:
            //       [
            //         "assets/images/photo_2025-08-20_15-08-01.jpg",
            //         "assets/images/photo_2025-08-20_15-08-31.jpg",
            //         "assets/images/photo_2025-08-20_15-08-37.jpg",
            //       ].map((path) {
            //         return ClipRRect(
            //           borderRadius: BorderRadius.circular(16),
            //           child: Image.asset(
            //             path,
            //             fit: BoxFit.cover,
            //             width: double.infinity,
            //           ),
            //         );
            //       }).toList(),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const TeacherAdvListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => _launchUrl(url),
        child: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          radius: 28,
          child: Icon(icon, color: color, size: 25),
        ),
      ),
    );
  }
}
