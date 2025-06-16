import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white1,
        centerTitle: true,
        title: Text("ملفي"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFA2E3F5), // Light blue
                    AppColor.primaryColor,
                    AppColor.primaryColor, // Dark blue
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: QrImageView(
                  data: "10",
                  version: QrVersions.auto,
                  size: 220.0,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          ProfileField(
            onTap: () {},
            text: "معلوماتي الشخصية",
            iconData: Icons.person,
          ),
          ProfileField(
            onTap: () {},
            text: "التقدم الأكاديمي",
            iconData: Icons.book_outlined,
          ),
          ProfileField(
            onTap: () {},
            text: "المدفوعات",
            iconData: Icons.payment_outlined,
          ),
          ProfileField(
            onTap: () {},
            text: "الألأرشيف",
            iconData: Icons.archive,
          ),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final IconData iconData;
  const ProfileField({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          height: 50,
          alignment: Alignment.centerRight,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Row(children: [Icon(Icons.person), Text(text)]),
          ),
        ),
      ),
    );
  }
}
