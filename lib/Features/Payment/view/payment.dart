import 'package:ajyal/Features/Payment/view/bloc/cubit/stripe_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentStripe extends StatefulWidget {
  const PaymentStripe({super.key});

  @override
  State<PaymentStripe> createState() => _PaymentState();
}

class _PaymentState extends State<PaymentStripe> {
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StripeLinkCubit, StripeLinkState>(
        builder: (context, state) {
          return Center(
            child:
                state is Loading
                    ? CircularProgressIndicator()
                    : state is Success
                    ? MaterialButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        openLink(state.stripeLink.link);
                      },
                      child: const Text("pay"),
                    )
                    : state is Fail
                    ? Text(state.errMessage)
                    : Text("Something happen"),
          );
        },
      ),
    );
  }
}
