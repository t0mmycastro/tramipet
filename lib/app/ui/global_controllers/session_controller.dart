import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final AuthenticationRepository _auth = Get.i.find();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
  }
}

final sessionProvider = SimpleProvider(
  (ref) => SessionController(),
  autoDispose: false,
);
