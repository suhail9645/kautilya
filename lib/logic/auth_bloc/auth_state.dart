part of 'auth_cubit.dart';


abstract class AuthState {}

 class AuthInitial extends AuthState {}

 class LoadingState extends AuthState{}
 
 class VerificatinCompleteState extends AuthState{}

 class VerificatinErrorState extends AuthState{
  final String error;

  VerificatinErrorState({required this.error});
 }
 class SmsCodeSentState extends AuthState{
  final String verificationId;

  SmsCodeSentState({required this.verificationId});
 }
 class TimoutState extends AuthState{


 }
 class OtpIncorrentState extends AuthState{
  final String error;

  OtpIncorrentState({required this.error});
}