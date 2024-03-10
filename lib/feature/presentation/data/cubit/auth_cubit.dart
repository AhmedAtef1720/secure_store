import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_store/feature/presentation/data/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitStates());

  registerClient(String name, String email, String password) async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('Client').doc(user.uid).set({
        'name': name,
        'email': user.email,
        'image': '',
        'phone': '',
        'rate': '',
      }, SetOptions(merge: true));

      emit(SignUpSuccesState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorState(error: ' weak-password '));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpErrorState(error: '  the account already existes'));
      } else {
        emit(SignUpErrorState(error: 'wrong '));
      }
    }
  }
  
  // registerDoctor(String name, String email, String password) async {
  //   try {
  //     emit(SignUpLoadingState());
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     User user = credential.user!;
  //     await user.updateDisplayName(name);
  //     FirebaseFirestore.instance.collection('Doctor').doc(user.uid).set({
  //       'name': name,
  //       'email': user.email,
  //       'image': '',
  //       'bio': '',
  //       'phone': '',
  //       'address': '',
  //       'age': '',
  //       'specialization': '',

  //     }, SetOptions(merge: true));

  //     emit(SignUpSuccesState());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       emit(SignUpErrorState(error: 'كلمه المرور ضعيفه'));
  //     } else if (e.code == 'email-already-in-use') {
  //       emit(SignUpErrorState(error: 'الحساب موجود بالفعل'));
  //     } else {
  //       emit(SignUpErrorState(error: 'حدث خطأ'));
  //     }
  //   }
  // }
}
