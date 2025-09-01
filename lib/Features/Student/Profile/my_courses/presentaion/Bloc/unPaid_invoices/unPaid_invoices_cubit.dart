import 'package:ajyal/Features/Student/Profile/my_courses/data/models/unpaid_invoice_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'unPaid_invoices_state.dart';

class UnPaidInvoicesCubit extends Cubit<UnPaidInvoicesState> {
  UnPaidInvoicesCubit(this.profileRepo) : super(UnPaidInvoicesInitial());
  final ProfileRepo profileRepo;

  Future<void> getunPaidInvoices({
    required int idStdent,
    required idCourse,
  }) async {
    emit(UnPaidInvoicesLoading());
    final response = await profileRepo.getunPaidInvoices(idStdent, idCourse);
    response.fold(
      (err) => emit(UnPaidInvoicesFailure(errMsg: err.errorMessage)),
      (unPaid) => emit(UnPaidInvoicesSuccess(unpaidInvoicesModel: unPaid)),
    );
  }
}
