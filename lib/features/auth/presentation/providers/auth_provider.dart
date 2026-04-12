import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

class AuthNotifier extends Notifier<UserModel?> {
  @override
  UserModel? build() {
    return null;
  }

  Future<UserModel?> signIn(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.signIn(email, password);
    state = user;
    return user;
  }

  Future<UserModel?> signUp(String email, String password, String name, String role, String phone) async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.signUp(email, password, name, role, phone);
    state = user;
    return user;
  }

  Future<void> signOut() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
    state = null;
  }

  void setUser(UserModel? user) {
    state = user;
  }
}

final authStateProvider = NotifierProvider<AuthNotifier, UserModel?>(() {
  return AuthNotifier();
});
