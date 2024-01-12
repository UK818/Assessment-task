import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationCubit() : super(AuthenticationInitial());

  void signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationSuccess());
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void signOut() async {
    await _firebaseAuth.signOut();
    emit(AuthenticationInitial());
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
