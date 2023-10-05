import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool>{
  LoadingCubit():super(false);
  
  changingTheValue()async{
    await Future.delayed(const Duration(seconds: 1));
    if(!isClosed){
    emit(!state);
    }
  }
}