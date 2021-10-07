import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
}
