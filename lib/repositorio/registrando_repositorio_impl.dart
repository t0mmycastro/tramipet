import 'package:firebase_auth/firebase_auth.dart';
import 'package:tramipet/app/domain/responses/sign_up_response.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;

  SignUpRepositoryImpl(this._auth);

  @override
  Future<SignUpResponse> registrando(SignUpData data) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: data.email, password: data.password);
      await userCredential.user!.updateDisplayName(
        "${data.nombre} ${data.apellido}",
      );
      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(parseStringToSignUpError(e.code), null);
    }
  }
}
