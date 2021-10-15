import 'package:flutter_meedu/meedu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tramipet/app/data/repositories_impl/account_repository_impl.dart';
import 'package:tramipet/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:tramipet/app/data/repositories_impl/preferences_repository_impl.dart';
import 'package:tramipet/app/domain/repositories/account_repository.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';
import 'package:tramipet/app/domain/repositories/preferences_repository.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';
import 'package:tramipet/repositorio/registrando_repositorio_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> injectDependencies() async {
  final preferences = await SharedPreferences.getInstance();
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );

  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );

  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );

  Get.i.lazyPut<PreferencesRepository>(
    () => PreferencesRepositoryImpl(preferences),
  );
}
