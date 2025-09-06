import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/get_send_mssge.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/parent_name_widget.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Widgets/top_contact_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  late final ContactUsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ContactUsCubit.get(context);
    cubit.getParentName(); // استدعاء مرة واحدة فقط
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopContactUsWidget(size: size),
            const SizedBox(height: 16),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              buildWhen:
                  (previous, current) =>
                      current is ContactUsParentSuccess ||
                      current is ContactUsParentFail ||
                      current is ContactUsParentLoading,
              builder: (context, state) {
                if (state is ContactUsParentSuccess) {
                  return ParentNameWidget(state: state);
                } else if (state is ContactUsParentFail) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "حدث خطأ: ${state.errMessage}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
            const Text(
              "نحن هنا لاستقبال ملاحظاتكم واستفساراتكم...",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.primaryColor, height: 2),
            ),
            const SizedBox(height: 20),
            const Text(
              "* راجع قسم الإشعارات من أجل تلقي الرد",
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColor.purple, height: 1),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              buildWhen:
                  (previous, current) =>
                      current is ContactUsMessageLoading ||
                      current is ContactUsMessageSuccess ||
                      current is ContactUsMessageFail,
              builder: (context, state) {
                return GetAndSendMessage(cubit: cubit);
              },
            ),
          ],
        ),
      ),
    );
  }
}
