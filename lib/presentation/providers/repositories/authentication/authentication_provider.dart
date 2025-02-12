import 'package:cinematl_app/data/firebase/firebase_authentication.dart';
import 'package:cinematl_app/data/repositories/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    FirebaseAuthentication(firebaseAuth: null);

    // JADI SEMUANYA BIASA DI GANTI DARI REPOSITORY DI PROVIDERS 

    //  DummyAuthentication(firebaseAuth: null);
