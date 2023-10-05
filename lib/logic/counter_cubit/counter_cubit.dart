import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(30);

  Future<void> onDecreasingTheTime(int time) async {
    await Future.delayed(const Duration(seconds: 1));
   int newTime=time-1;
    emit((newTime));
  }

  Future<void> onResendTheOtp() async {
    emit(30);
  }
}
