import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_adv_state.dart';

class GeneralAdvCubit extends Cubit<GeneralAdvState> {
  final AdvRepo advRepo;
  GeneralAdvCubit(this.advRepo) : super(GeneralAdvInitial());

  Future<void> getGeneralAdv({int page = 1}) async {
    emit(GeneralAdvLoading());
    final response = await advRepo.getAllGeneralAdv();
    response.fold(
      (err) => emit(GeneralAdvFailure(errMssg: err.errorMessage)),
      (advs) => emit(GeneralAdvSuccess(model: advs)),
    );
  }
}
