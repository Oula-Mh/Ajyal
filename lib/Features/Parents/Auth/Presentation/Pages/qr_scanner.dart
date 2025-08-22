import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../../Custom/Custom_ui.dart/gradient_background_widget.dart';

class QrScanner extends StatefulWidget {
  final String name;
  final String number;
  final String passowrd;
  final String rePassword;
  const QrScanner({
    super.key,
    required this.name,
    required this.number,
    required this.passowrd,
    required this.rePassword,
  });
  @override
  State<QrScanner> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QrScanner> {
  bool isScanned = false;
  // void handleQRCode(String code, RegisterParentCubit cubit) {
  //   if (isScanned) return;
  //   setState(() {
  //     isScanned = true;
  //   });
  //   cubit.register(code);
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterParentCubit.get(context);
    return BlocConsumer<RegisterParentCubit, RegisterParentState>(
      listener: (context, state) {
        if (state is RegisterParentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنجاح")));
          Future.delayed(Duration(seconds: 2), () {
            GoRouter.of(context).push(AppRouter.parentLogin);
          });
        } else if (state is RegisterParentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("فشل تسجيل الدخول: ${state.errMessage}")),
          );
          GoRouter.of(context).go('/qrScannerPage');
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
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                      //Expanded(
                      // child:
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
                                cubit.register(
                                  code,
                                  widget.name,
                                  widget.passowrd,
                                  widget.rePassword,
                                  widget.number,
                                );
                              }
                            },

                            //handleQRCode(code, cubit);
                          ),
                        ),
                      ),
                      // ),
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
