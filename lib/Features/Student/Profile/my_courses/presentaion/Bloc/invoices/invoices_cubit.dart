import 'package:ajyal/Features/Student/Profile/my_courses/data/models/invoices_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  InvoicesCubit(this.profileRepo) : super(InvoicesInitial());
  final ProfileRepo profileRepo;

  Future<void> getinvoices({required int idStudent}) async {
    emit(InvoicesLoading());
    final response = await profileRepo.getInvoices(idStudent);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(InvoicesFailure(errMsg: err.errorMessage)),
      (invoices) => emit(InvoicesSuccess(invoicesModel: invoices)),
    );
  }
}
