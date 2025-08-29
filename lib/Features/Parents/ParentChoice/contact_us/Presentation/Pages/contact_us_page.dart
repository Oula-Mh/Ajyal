import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/get_send_mssge.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/parent_name_widget.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/top_contact_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: BlocBuilder<ContactUsCubit, ContactUsState>(
          builder: (context, state) {
            final cubit = ContactUsCubit.get(context);
            return Column(
              children: [
                // الجزء العلوي
                TopContactUsWidget(size: size),

                const SizedBox(height: 16),

                // اسم الشخص وعبارة الترحيب
                ParentNameWidget(state: state),

                const SizedBox(height: 24),

                // حقل إدخال الرسالة
                GetAndSendMessage(cubit: cubit),
              ],
            );
          },
        ),
      ),
    );
  }
}
