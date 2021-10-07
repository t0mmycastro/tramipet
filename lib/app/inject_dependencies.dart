import 'package:flutter_meedu/meedu.dart';
import 'package:tramipet/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:tramipet/app/domain/repositories/authentication_repository.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';
import 'package:tramipet/repositorio/registrando_repositorio_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );

  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
}
