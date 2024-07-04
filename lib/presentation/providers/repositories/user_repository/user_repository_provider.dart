import 'package:flix_id/data/firebase/firebase_user_repository.dart';
import 'package:flix_id/data/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    FirebaseUserRepository(firebaseFirestore: null);

    // JADI BISA DI GANT DISIN JIKA KITA INGIN UNTUK MENGUBAH LOGIC DARI USER REPPOSITORY  
    // DummUserRepository(firebaseFirestore: null);
