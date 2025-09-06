import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ParentPageChoice extends StatelessWidget {
  const ParentPageChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade300),
            ),
            child: Row(
              children: [
                // زر الإشعارات
                // Expanded(
                //   child: InkWell(
                //     onTap: () async {
                //       await resetNotiCountInPrefs();
                //       GoRouter.of(context).push(AppRouter.parentNotification);
                //     },
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 14),
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "الإشعارات",
                //               style: TextStyle(
                //                 fontSize: 15.5,
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColor.primaryColor,
                //               ),
                //             ),
                //             SizedBox(width: 10),
                //             Badge(
                //               label: Padding(
                //                 padding: const EdgeInsets.all(1.5),
                //                 child: Text(
                //                   "2",
                //                   style: const TextStyle(color: Colors.white),
                //                 ),
                //               ),
                //               backgroundColor: const Color.fromARGB(
                //                 255,
                //                 245,
                //                 106,
                //                 96,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await resetNotiCountInPrefs();
                      GoRouter.of(context).push(AppRouter.parentNotification);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "الإشعارات",
                              style: TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),

                            // هنا نطبق ValueListenableBuilder
                            ValueListenableBuilder<int>(
                              valueListenable: notiCountNotifier,
                              builder: (context, count, _) {
                                return count == 0
                                    ? const SizedBox.shrink() // لا نعرض Badge إذا صفر
                                    : Badge(
                                      label: Padding(
                                        padding: const EdgeInsets.all(1.5),
                                        child: Text(
                                          count.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        245,
                                        106,
                                        96,
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Divider عمودي
                Container(width: 1, height: 40, color: Colors.blue.shade300),

                // زر تسجيل الخروج
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showLogoutDialogParent(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Text(
                          "تسجيل خروج",
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 17),

          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 15,
            childAspectRatio: 1.8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              gridTile("نتائج الطالب", () {
                GoRouter.of(context).push(AppRouter.studentMarkAnalysis);
              }),
              gridTile("تقييم الحضور", () {
                GoRouter.of(context).push(AppRouter.attendecePage);
              }),
              gridTile("الأقساط المالية", () {
                GoRouter.of(context).push(
                  AppRouter.invoicesPage,
                  extra: int.parse(
                    getit<CacheHelper>().getData(key: "studentId"),
                  ),
                );
              }),
              gridTile("التواصل مع الإدارة", () {
                GoRouter.of(context).push(AppRouter.contactUsPage);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget gridTile(String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue.shade300),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
