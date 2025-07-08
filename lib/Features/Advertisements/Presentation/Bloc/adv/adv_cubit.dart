import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo.dart';
import 'package:ajyal/fake_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'adv_state.dart';

class AdvCubit extends Cubit<AdvState> {
  final AdvRepo advRepo;
  AdvCubit(this.advRepo) : super(AdvInitial());

  List<CourseAdvModel> advList = [];

  ///AdvPaginationModel paginationModel ;

  Future<void> getCourseAdv({int page = 1}) async {
    emit(AdvLoading());
    final response = await advRepo.getAllCourseAdv();
    response.fold((err) => emit(AdvFailure(errMssg: err.errorMessage)), (advs) {
      advList = advs.data!;
      emit(CourseAdvSuccess(model: advs));
    });
  }
}
    //   emit(AdvLoading());
    //   final response = await studentRepo.login({
    //     "password": passWordController.text,
    //     "access_code": codeController.text,
    //   });
    //   if (isClosed) return;

    //   response.fold(
    //     (err) {
    //       if (!isClosed) emit(LoginFail(errMessage: err.errorMessage));
    //     },
    //     (success) {
    //       if (!isClosed) emit(LoginSuccess(message: success));
    //     },
    //   );
    // }
//   }
// }
