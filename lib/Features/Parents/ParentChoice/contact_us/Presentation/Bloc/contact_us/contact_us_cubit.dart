import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Data/repo/contact_us_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepo contactUsRepo;
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());

  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();

  Future<void> getParentName() async {
    emit(ContactUsLoading());
    var result = await contactUsRepo.getParentInfo();
    result.fold(
      (fail) {
        emit(ContactUsFail(errMessage: fail.errorMessage));
      },
      (success) {
        emit(ContactUsSuccess(name: success));
      },
    );
  }

  Future<void> sendMessage() async {
    emit(ContactUsLoading());
    var result = await contactUsRepo.sendMessage({
      'message': messageController.text,
    });
    result.fold(
      (fail) {
        emit(ContactUsFail(errMessage: fail.errorMessage));
      },
      (success) {
        emit(ContactUsSuccess(name: success));
      },
    );
  }

  printsS() {
    print(messageController.text);
  }
}
