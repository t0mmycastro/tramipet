import 'package:firebase_auth/firebase_auth.dart';
import 'package:tramipet/app/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final FirebaseAuth _auth;

  AccountRepositoryImpl(this._auth);

  @override
  Future<User> updateDisplayName(String value) async {
    final user = _auth.currentUser;
    assert(user != null);
    await user!.updateDisplayName(value);
    return user;
  }
}
