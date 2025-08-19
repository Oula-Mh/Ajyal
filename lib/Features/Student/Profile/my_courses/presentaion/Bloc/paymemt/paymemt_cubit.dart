import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paymemt_state.dart';

class PaymemtCubit extends Cubit<PaymemtState> {
  PaymemtCubit() : super(PaymemtInitial());
}
