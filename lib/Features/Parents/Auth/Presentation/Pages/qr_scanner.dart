import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../Custom/Custom_ui.dart/gradient_background_widget.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QrScanner> {
  bool isScanned = false;

  void handleQRCode(String code) {
    if (isScanned) return;
    setState(() {
      isScanned = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SuccessPage(data: code)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  //Expanded(
                  // child:
                  Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFA38097), width: 5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MobileScanner(
                        onDetect: (BarcodeCapture capture) {
                          final barcode = capture.barcodes.first;
                          final String? code = barcode.rawValue;
                          if (code != null) handleQRCode(code);
                        },
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
    );
  }
}

class SuccessPage extends StatelessWidget {
  final String data;
  const SuccessPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تم المسح')),
      body: Center(child: Text('البيانات: $data')),
    );
  }
}
