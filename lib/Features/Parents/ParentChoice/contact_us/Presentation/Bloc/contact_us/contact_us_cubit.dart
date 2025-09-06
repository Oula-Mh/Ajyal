import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Data/repo/contact_us_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepo contactUsRepo;
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());

  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();

  // --- جلب اسم ولي الأمر ---
  Future<void> getParentName() async {
    emit(ContactUsParentLoading());
    var result = await contactUsRepo.getParentInfo();
    result.fold(
      (fail) => emit(ContactUsParentFail(errMessage: fail.errorMessage)),
      (success) => emit(ContactUsParentSuccess(name: success)),
    );
  }

  // --- إرسال الرسالة ---
  Future<void> sendMessage() async {
    emit(ContactUsMessageLoading());
    var result = await contactUsRepo.sendMessage({
      'content': messageController.text,
      'student_id': getit<CacheHelper>().getData(key: "studentId"),
    });
    result.fold(
      (fail) => emit(ContactUsMessageFail(errMessage: fail.errorMessage)),
      (success) => emit(ContactUsMessageSuccess()),
    );
  }
}
