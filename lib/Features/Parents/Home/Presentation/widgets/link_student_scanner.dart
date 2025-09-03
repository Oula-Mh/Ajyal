import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/bloc/StudentLink/student_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../../Custom/Custom_ui.dart/gradient_background_widget.dart';

class LinkStudentScanner extends StatefulWidget {
  const LinkStudentScanner({super.key});
  @override
  State<LinkStudentScanner> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<LinkStudentScanner> {
  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    final cubit = StudentLinkCubit.get(context);
    return BlocConsumer<StudentLinkCubit, StudentLinkState>(
      listener: (context, state) {
        if (state is StudentLinkSuccessfully) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Future.delayed(Duration(seconds: 1), () {
            GoRouter.of(context).push(AppRouter.allStudentLinked);
          });
        } else if (state is FailState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("حدث خطأ في الربط : ${state.errMessage}")),
          );
          //GoRouter.of(context).go(AppRouter.)
        }
      },
      builder: (context, state) {
        return (Scaffold(
          body: GradientBackgroundWidget(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'امسح الرمز الخاص بالطالب',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        height: 450,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.purple, width: 5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: MobileScanner(
                            onDetect: (BarcodeCapture capture) {
                              final barcode = capture.barcodes.first;
                              final String? code = barcode.rawValue;
                              if (code != null) {
                                if (isScanned) return;
                                setState(() {
                                  isScanned = true;
                                });
                                //print(code);
                                print("✅✅✅ scannde doneee  ${code}");
                                //cubit.linkStudent({'student_id': code});
                                // cubit.register(
                                //   code,
                                //   widget.name,
                                //   widget.passowrd,
                                //   widget.rePassword,
                                //   widget.number,
                                // );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
