import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';
import 'package:tramipet/app/domain/responses/sign_in_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _auth = firebaseAuth,
        _googleSignIn = googleSignIn {
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() async {
    _auth.authStateChanges().listen(
      (User? user) {
        if (!_completer.isCompleted) {
          _completer.complete();
        }
        _user = user;
      },
    );
  }

  @override
  Future<void> signOut() async {
    final data = _user?.providerData ?? [];
    String providerId = 'firebase';
    for (final provider in data) {
      if (provider.providerId != 'firebase') {
        providerId = provider.providerId;
        break;
      }
    }
    if (providerId == 'google.com') {
      _googleSignIn.signOut();
    }
    return _auth.signOut();
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user!;
      var userData = {
        'nombre y apellido': user.displayName,
        'provider': 'normal',
        'uid': user.uid,
        'email': user.email,
      };

      users.doc(user.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userData);
        } else {
          // Nuevo usuario :D
          users.doc(user.uid).set(userData);
        }
      });

   
      return SignInResponse(
          user: user,
          providerId: userCredential.credential?.providerId,
          error: null);
    } on FirebaseAuthException catch (e) {
      return getSignInError(e);
    }
  }

  @override
  Future<SignInResponse> signInWithGoogle() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return SignInResponse(
          error: SignInError.cancelled,
          user: null,
          providerId: null,
        );
      }

      final googleAuth = await account.authentication;

      final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(oAuthCredential);

      final User user = userCredential.user!;

      var userData = {
        'Nombre': account.displayName,
        'provider': 'google',
        'photoUrl': account.photoUrl,
        'email': account.email,
      };

      users.doc(user.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userData);
        } else {
          // Nuevo usuario :D
          users.doc(user.uid).set(userData);
        }
      });

      return SignInResponse(
          error: null,
          user: userCredential.user,
          providerId: userCredential.credential?.providerId);
    } on FirebaseAuthException catch (e) {
      e.credential?.providerId;
      return getSignInError(e);
    }
  }
}
