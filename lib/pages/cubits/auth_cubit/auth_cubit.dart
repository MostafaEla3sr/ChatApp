import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user not found'));

      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong password'));

      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Login failed , Please try login again'));
    }
  }

  Future<void> registerUser({required String email , required String password}) async {
    emit(SignUpLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
      emit(SignUpSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(errorMessage: 'Email already in use'));
      }
    }catch (e) {
      emit(SignUpFailure(errorMessage: 'Sign up failed , please try again'));
    }
  }

}
