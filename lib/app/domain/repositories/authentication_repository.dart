import 'package:firebase_auth/firebase_auth.dart';
import 'package:tramipet/app/domain/responses/sign_in_response.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithGoogle();
}
