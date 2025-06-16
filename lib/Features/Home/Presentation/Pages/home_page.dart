import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_nav_bar.dart';
import 'package:ajyal/Features/Student/Profile/Presentation/Pages/profile_page.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [ProfilePage(), AdPage(), SubjectPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
      body: _children[_currentIndex],
    );
  }
}

class AdPage extends StatelessWidget {
  const AdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF365EB1), Color(0xFF17284B)],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height / 1.25,
          decoration: BoxDecoration(
            color: AppColor.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Text("صفحة الإعلانات", style: Styles.meduimBlack),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.rolePage);
                },
                color: AppColor.primaryColor,
                child: Text("تسجيل الدحول", style: Styles.meduimWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
