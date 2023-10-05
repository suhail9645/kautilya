import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  //validating phone number
  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber == '') {
      return 'Please Enter A Phone Number';
    } else if (phoneNumber.length < 10) {
      return 'Phone Number is To Short';
    } else if (phoneNumber.length > 10) {
      return 'Phone Number is To Big';
    }
    int? number = int.tryParse(phoneNumber);
    if (number == null) {
      return 'Phone Number is Not Valid';
    }
    return null;
  }

  String?validatingOtp(String otp){
    if(otp==''){
      return 'Please Enter The OTP';
    }else if(otp.length<6){
      return 'OTP should be six digits';
    }else{
      return null;
    }
  }
  phoneNumberSubmitedEvent(String number) async {
    emit(LoadingState());
     await Future.delayed(const Duration(seconds: 3));
    String firstPart = number.substring(0, 4);
    String secondPart = number.substring(4, 7);
    String thirdpart = number.substring(7);
    String phoneNumber = '$firstPart-$secondPart-$thirdpart';
    await FirebaseAuth.instance.verifyPhoneNumber(
     
      phoneNumber: '+91 $phoneNumber',
      timeout: const Duration(seconds: 30),
     
      verificationCompleted: (phoneAuthCredential) {
        emit(VerificatinCompleteState());
      },
      verificationFailed: (error) {
        emit(VerificatinErrorState(error: error.code));
      },
      codeSent: (verificationId, forceResendingToken) {
        emit(SmsCodeSentState(verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        emit(TimoutState());
      },
    );
  }

  void signInEvent(String otp, String verificationId) async {

    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try{
    await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    emit(VerificatinCompleteState());
      
  }on FirebaseAuthException catch(e){
    emit(OtpIncorrentState(error: e.code));
  }
  catch(e){
    emit(OtpIncorrentState(error: 'Something Wrong, Please Try Again'));
  }
}
}